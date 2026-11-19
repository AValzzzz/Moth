# moth

A lightweight nano-inspired terminal text editor written in C, with a few extra improvements.

[![CI](https://github.com/AValzzzz/moth/actions/workflows/ci.yml/badge.svg)](https://github.com/AValzzzz/moth/actions/workflows/ci.yml)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)

> **Status:** early development. Expect missing features and rough edges.

## Goals

- Simple and easy to use, in the spirit of `nano`
- Small, readable C codebase with no external dependencies
- Fast startup and low resource usage
- A few quality-of-life improvements over `nano`

## Roadmap

- [ ] Open, edit and save files
- [ ] Cursor movement and scrolling
- [ ] Search (incremental)
- [ ] Undo / redo
- [ ] Syntax highlighting
- [ ] Configuration file

## Building

Requirements: a C compiler (`gcc` or `clang`), `make`, and a POSIX system (Linux or macOS).

```sh
git clone https://github.com/AValzzzz/moth.git
cd moth
make
```

| Command      | Description              |
| ------------ | ------------------------ |
| `make`       | Build the `moth` binary  |
| `make clean` | Remove object files      |
| `make re`    | Full rebuild             |

## Usage

```sh
./moth [file]
```

## Project layout

```
.
├── Makefile
├── src/        # C sources and headers
├── obj/        # build artifacts (ignored by git)
└── .github/    # CI, issue and pull request templates
```

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) and our
[Code of Conduct](CODE_OF_CONDUCT.md) before opening an issue or a pull request.

To report a security vulnerability, see [SECURITY.md](SECURITY.md).

## License

Licensed under the [Apache License 2.0](LICENSE). See [NOTICE](NOTICE) for attribution.

Copyright 2026 AValzzzz