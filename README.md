# getdross/homebrew-tap

Private Homebrew tap for [dross](https://github.com/wzohny/dross). Not a Homebrew core formula.

The formula installs the arm64 archive from the private `v0.1.0` release. An Intel Mac uses the direct download from that release instead.

`gh` must be logged in as an account that can read `wzohny/dross`. Tapping this private repository uses that login. Homebrew 7 does not pass `HOMEBREW_GITHUB_API_TOKEN` into the archive download. The formula asks Homebrew for credentials: that variable if it is still visible, then `gh auth token`, then the macOS keychain.

```sh
brew tap getdross/tap
brew trust getdross/tap
brew install dross
"$(brew --prefix)/bin/dross" --version
```

`brew trust` is required on Homebrew 7. The version command uses Homebrew's `dross`, not another binary earlier on `PATH`.

`brew update` refreshes this tap. A newer dross release is installed only after this formula's `version` and `sha256` change. `brew uninstall dross` removes it.
