# getdross/homebrew-tap

Homebrew tap for [dross](https://github.com/getdross/dross). Not a Homebrew core formula.

The formula installs the arm64 archive from the public `v0.1.0` release. An Intel Mac downloads `dross-cli-x86_64-apple-darwin.tar.xz` from that release instead.

```sh
brew tap getdross/tap
brew trust getdross/tap
brew install dross
"$(brew --prefix)/bin/dross" --version
```

`brew trust` is required once on Homebrew 7. No GitHub login is required. The version command uses Homebrew's `dross`, not another binary earlier on `PATH`.

`brew update` refreshes this tap. A newer dross release is installed only after this formula's `version` and `sha256` change. `brew uninstall dross` removes it.
