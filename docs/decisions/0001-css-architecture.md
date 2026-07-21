# ADR 0001: Layered CSS source with static distribution

## Context

CKCSS needs to remain a single-file consumer dependency while avoiding the monolithic,
hard-to-maintain architecture found in older CSS frameworks.

## Decision

Maintain modular CSS sources under `src/`, organized with cascade layers. Publish
committed static files in `dist/`. A release assembler/minifier may exist for
maintainers, but consumers always use the prebuilt CSS files directly.

## Consequences

- Consumers never install Node.js or run a build.
- Maintainers can improve source organization without exposing internal filenames.
- Release automation must guarantee deterministic `dist/` artifacts.
