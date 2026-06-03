# homebrew-decree

A [Homebrew](https://brew.sh) tap for [decree](https://github.com/doruksahin/decree) —
a CLI for the software decision lifecycle (PRDs → ADRs → SPECs, with cross-type
references, status enforcement, and validation).

decree is distributed from GitHub Releases rather than PyPI, because the package
name `decree` on PyPI belongs to an unrelated third-party project.

## Install

```bash
brew install doruksahin/decree/decree
```

or, equivalently:

```bash
brew tap doruksahin/decree
brew install decree
```

Then:

```bash
decree --version
```

## How it stays current

The formula is bumped automatically by decree's release workflow on every
`vX.Y.Z` tag — the `homebrew` job in [`decree/.github/workflows/release.yml`](https://github.com/doruksahin/decree/blob/main/.github/workflows/release.yml)
rewrites the formula's `url` and `sha256` to the new release and pushes here. It
requires a `HOMEBREW_TAP_TOKEN` secret (a PAT with `Contents: write` on this repo)
configured in the decree repository.

## License

The formula is MIT-licensed, matching decree.
