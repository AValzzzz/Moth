# Security Policy

## Supported Versions

moth is in early development. Only the latest commit on `main` and the latest
tagged release receive security fixes.

| Version        | Supported          |
| -------------- | ------------------ |
| `main`         | :white_check_mark: |
| Latest release | :white_check_mark: |
| Older releases | :x:                |

## Reporting a Vulnerability

**Please do not report security vulnerabilities through public GitHub issues,
discussions, or pull requests.**

Instead, report them privately under the
**GitHub private vulnerability reporting** (preferred): go to the
   [Security tab](../../security/advisories/new) of this repository and click
   *Report a vulnerability*.

Please include as much of the following as possible:

- A description of the vulnerability and its potential impact
- Steps to reproduce (a minimal input file or key sequence is ideal)
- The affected version or commit hash
- Your OS, compiler, and terminal emulator
- Any suggested fix or mitigation

## What to expect

- **Acknowledgement** within 72 hours.
- **Initial assessment** within 7 days.
- Regular updates until the issue is resolved.
- Credit in the release notes if you wish (let us know how you want to be
  named).

## Scope

As a text editor handling untrusted files and terminal input, issues of
particular interest include:

- Memory safety bugs (buffer overflows, use-after-free, double free,
  out-of-bounds reads/writes)
- Crashes or hangs caused by crafted files or escape sequences
- Unsafe handling of temporary, backup, or swap files (symlink attacks, race
  conditions, wrong permissions)
- Terminal escape sequence injection through file contents

Out of scope: vulnerabilities in third-party tools, terminals, or the operating
system itself, and issues requiring prior local root access.

## Disclosure Policy

Please give a reasonable amount of time to fix the issue before any public disclosure.
