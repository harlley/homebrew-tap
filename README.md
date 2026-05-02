# homebrew-tap

Personal Homebrew tap for [@harlley](https://github.com/harlley).

## Install

```bash
brew tap harlley/tap
brew install --cask fluencylog
brew upgrade fluencylog
```

## Casks

- `fluencylog` — native macOS English fluency coach. Source: [harlley/fluencylog](https://github.com/harlley/fluencylog)

## How updates work

The `fluencylog` cask is bumped automatically by the
[`release-macos.yml`](https://github.com/harlley/fluencylog/blob/main/.github/workflows/release-macos.yml)
workflow on every `v*` tag (non-prerelease). The workflow downloads the published
`FluencyLog-<version>-macos.zip`, computes its sha256, edits this repo's
`Casks/fluencylog.rb`, and pushes a `fluencylog <version>` commit using a PAT
stored as `HOMEBREW_TAP_TOKEN` in the source repo.
