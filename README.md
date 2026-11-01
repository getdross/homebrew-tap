# getdross/homebrew-tap

Private Homebrew tap for [dross](https://github.com/wzohny/dross).

The formula installs the arm64 archive from the private `v0.1.0` release. Tapping this repository uses your existing `gh` login. Export a token that can read `wzohny/dross` before installing. If Homebrew hides that variable from the download, the formula uses `gh auth token` instead.

```sh
export HOMEBREW_GITHUB_API_TOKEN=github_pat_...
brew tap getdross/tap
brew trust getdross/tap
brew install dross
dross --version
```

The token stays in your shell. It is not part of the formula.
