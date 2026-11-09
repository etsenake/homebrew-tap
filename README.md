# etsenake/homebrew-tap

Homebrew tap for [Pi Garden](https://github.com/etsenake/pi-garden) and
[Parc](https://github.com/etsenake/parc-releases).

```bash
brew tap etsenake/tap
brew install --cask pi-garden
brew install --cask parc
```

Upgrade with `brew upgrade --cask pi-garden` or `brew upgrade --cask parc`.

## Parc

Parc is an Apple Silicon macOS browser. Its signed and notarized releases are
published in the public [parc-releases](https://github.com/etsenake/parc-releases/releases)
repository, so no GitHub login is needed.

For a current manually installed copy, quit Parc, then use
`brew install --cask --adopt parc` to let Homebrew manage it.

`brew uninstall --cask parc` removes the application; your Parc profile is
preserved. This cask does not define a destructive `zap` step.
