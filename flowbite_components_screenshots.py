#!/usr/bin/env python3
"""Save screenshots of the public Flowbite Blocks component examples.

Usage:
    python3 -m pip install -r requirements-screenshots.txt
    playwright install chromium
    python3 flowbite_components_screenshots.py

The output directory is intentionally named ``componens-img`` to match the
project request.  Flowbite renders each example in an iframe; Playwright can
capture those frames without needing to inspect or copy their source code.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path
from urllib.parse import urljoin, urlparse


DEFAULT_URL = "https://flowbite.com/blocks/"
DEFAULT_VIEWPORT = {"width": 1440, "height": 1200}


def safe_name(value: str, fallback: str = "component") -> str:
    """Return a stable, filesystem-safe name while keeping it readable."""
    value = re.sub(r"[^a-zA-Z0-9_-]+", "-", value.strip().lower())
    value = re.sub(r"-+", "-", value).strip("-")
    return value or fallback


def category_links(page, base_url: str) -> list[str]:
    """Find category pages from the public Blocks index."""
    base = urlparse(base_url)
    links = page.locator("a").evaluate_all(
        """anchors => anchors.map(anchor => anchor.href)"""
    )
    result: list[str] = []
    seen: set[str] = set()
    for href in links:
        parsed = urlparse(urljoin(base_url, href))
        path = parsed.path.rstrip("/")
        base_path = base.path.rstrip("/")
        if parsed.netloc != base.netloc or not path.startswith(base_path + "/"):
            continue
        if path == base_path or href.startswith("#"):
            continue
        normalized = f"{parsed.scheme}://{parsed.netloc}{path}/"
        if normalized not in seen:
            seen.add(normalized)
            result.append(normalized)
    return result


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Capture Flowbite Blocks component examples as PNG files."
    )
    parser.add_argument("--url", default=DEFAULT_URL, help="Flowbite Blocks index URL")
    parser.add_argument(
        "--category",
        action="append",
        help="Capture only this category URL; may be supplied more than once",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=Path(__file__).resolve().parent / "componens-img",
        help="Output directory (default: project-root/componens-img)",
    )
    parser.add_argument("--max-categories", type=int, help="Limit discovered categories")
    parser.add_argument("--width", type=int, default=DEFAULT_VIEWPORT["width"])
    parser.add_argument("--height", type=int, default=DEFAULT_VIEWPORT["height"])
    parser.add_argument("--timeout", type=int, default=60000, help="Navigation timeout in ms")
    parser.add_argument("--headed", action="store_true", help="Show the browser window")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    try:
        from playwright.sync_api import TimeoutError as PlaywrightTimeoutError
        from playwright.sync_api import sync_playwright
    except ImportError:
        print(
            "Playwright is required. Run: python3 -m pip install -r "
            "requirements-screenshots.txt && playwright install chromium",
            file=sys.stderr,
        )
        return 2

    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    manifest: list[dict[str, str | int]] = []

    with sync_playwright() as playwright:
        browser = playwright.chromium.launch(headless=not args.headed)
        page = browser.new_page(viewport={"width": args.width, "height": args.height})
        page.set_default_timeout(args.timeout)

        print(f"Opening {args.url}")
        page.goto(args.url, wait_until="domcontentloaded", timeout=args.timeout)
        page.wait_for_timeout(2500)
        categories = args.category or category_links(page, args.url)
        if args.max_categories:
            categories = categories[: args.max_categories]
        print(f"Found {len(categories)} category page(s)")

        for category_url in categories:
            category_slug = safe_name(urlparse(category_url).path.rstrip("/").split("/")[-1])
            print(f"  {category_slug}: {category_url}")
            try:
                page.goto(category_url, wait_until="domcontentloaded", timeout=args.timeout)
                page.wait_for_timeout(2500)
                frames = page.locator("iframe")
                frame_count = frames.count()
                if not frame_count:
                    print("    no example iframes found; skipped")
                    continue

                for index in range(frame_count):
                    example = frames.nth(index)
                    try:
                        example.scroll_into_view_if_needed(timeout=args.timeout)
                        page.wait_for_timeout(350)
                        filename = f"{category_slug}-{index + 1:02d}.png"
                        path = output / filename
                        example.screenshot(path=str(path), animations="disabled")
                        manifest.append(
                            {
                                "file": filename,
                                "category": category_slug,
                                "category_url": category_url,
                                "example": index + 1,
                            }
                        )
                        print(f"    saved {filename}")
                    except PlaywrightTimeoutError as error:
                        print(f"    example {index + 1}: timed out ({error})", file=sys.stderr)
            except PlaywrightTimeoutError as error:
                print(f"    category timed out ({error})", file=sys.stderr)

        browser.close()

    manifest_path = output / "manifest.json"
    manifest_path.write_text(json.dumps(manifest, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"Saved {len(manifest)} screenshot(s) to {output}")
    print(f"Manifest: {manifest_path}")
    return 0 if manifest else 1


if __name__ == "__main__":
    raise SystemExit(main())
