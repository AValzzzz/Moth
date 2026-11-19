# Contributing to moth

Thanks for your interest in contributing to **moth**, a small terminal text
editor written in C, inspired by `nano`, `vim` and `vscode`! Every bit of help is welcome: bug
reports, feature ideas, documentation, and code.

By participating, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md).

## Ways to contribute

- **Report a bug** using the [bug report template](../../issues/new/choose).
- **Suggest a feature** using the feature request template.
- **Improve the docs** (README, comments, man page...).
- **Fix an issue**: look for `good first issue` and `help wanted` labels.

For anything bigger than a small fix, please **open an issue first** so we can
discuss the approach before you spend time on it.

## Getting started

### Requirements

- A C compiler (`gcc` or `clang`)
- `make`
- A POSIX system (Linux or macOS)
- Optional: `valgrind`, `cppcheck`, `clang-format`

### Build

```sh
git clone https://github.com/AValzzzz/moth.git
cd moth
make
./moth
```

Useful targets:

| Command      | Description                          |
| ------------ | ------------------------------------ |
| `make`       | Build the `moth` binary              |
| `make clean` | Remove object files                  |
| `make re`    | Full rebuild                         |

### Debug with sanitizers

```sh
make re CC="gcc -g -fsanitize=address,undefined -fno-omit-frame-pointer"
```

## Workflow

1. **Fork** the repository and create a branch from `main`:
   `git checkout -b feat/short-description`
2. Make your changes, in small and focused commits.
3. Make sure the project **builds without warnings** (the Makefile uses
   `-Wall -Wextra -Werror`).
4. Test your change manually, and with sanitizers or `valgrind` if you touch
   memory handling.
5. Push your branch and open a **pull request** using the template.

## Coding style

- Language standard: C99 or later, POSIX APIs only (no platform-specific hacks
  without a fallback).
- Indentation: 4 spaces, no tabs in C files (tabs are required in the Makefile).
- Naming: `snake_case` for functions and variables, `UPPER_CASE` for macros and
  constants.
- Keep functions short and focused; one responsibility per function.
- Every `malloc`/`realloc` must be checked, and every allocation must have a
  clear owner responsible for freeing it.
- Restore the terminal state on **every** exit path (normal exit, error, signal).
- Prefer clear code over clever code, and comment the *why*, not the *what*.
- Headers go next to their source file in `src/` and use include guards.

## Commit messages

We loosely follow [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: add incremental search
fix: prevent crash when deleting at end of file
docs: explain build options
refactor: split input handling out of main
```

- Use the imperative mood ("add", not "added").
- Keep the subject line under 72 characters.
- Explain the *why* in the body when it is not obvious.

## Pull request checklist

- [ ] The code builds cleanly with no warnings
- [ ] Changes are focused on a single topic
- [ ] No memory leaks or invalid accesses introduced
- [ ] Documentation is updated if behavior changed
- [ ] CI is green

## Reporting security issues

Please **do not** open public issues for security vulnerabilities. See
[SECURITY.md](SECURITY.md) instead.

## License

By contributing, you agree that your contributions will be licensed under the
[Apache License 2.0](LICENSE).
