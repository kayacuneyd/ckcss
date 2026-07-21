# Security Policy

## Supported versions

CKCSS is in beta. Only the latest `0.1.x` pre-release receives security fixes.

| Version | Supported |
| --- | --- |
| 0.1.x (latest beta) | Yes |
| Older pre-releases | No |

## Scope

CKCSS Core is a static CSS file with no runtime, account system, or server
component. CKCSS Enhance modules are optional, dependency-free browser
scripts. Typical reports involve style-based UI redressing, unsafe token
values, or Enhance module DOM handling.

## Reporting a vulnerability

Please do **not** open a public issue for security reports. Contact Cüneyt Kaya
privately through <https://kayacuneyt.com> and include:

- A description of the issue and its impact.
- A minimal reproduction (HTML/CSS/JS snippet or page URL).
- The CKCSS version or the `dist/ckcss.min.css` hash you tested against.

We aim to acknowledge reports within 7 days and will coordinate disclosure
with you once a fix is available.
