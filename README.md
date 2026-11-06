# etsenake/homebrew-tap

Homebrew tap for [Pi Garden](https://github.com/etsenake/pi-garden) and
[Parc](https://github.com/etsenake/parc).

```bash
brew tap etsenake/tap
brew install --cask pi-garden
```

Upgrade with `brew upgrade --cask pi-garden`.

## Parc

Parc is an Apple Silicon macOS browser. The tap is public; its signed and
notarized release assets remain private. Your GitHub account needs access to
`etsenake/parc`. Authenticate once on each Mac:

```sh
brew install gh
gh auth login
brew install --cask etsenake/tap/parc
```

For a current manually installed copy, quit Parc, then use
`brew install --cask --adopt etsenake/tap/parc` to let Homebrew manage it.
Homebrew compares the bundle version/build; use adoption for the exact release
you have already verified. If it rejects a different build, move that
app aside and retry the regular install; keep the old copy until launch passes.

Upgrade with:

```sh
brew update
brew upgrade --cask etsenake/tap/parc
```

The cask pins each archive's SHA-256. It resolves your existing GitHub CLI,
Keychain or `HOMEBREW_GITHUB_API_TOKEN` credential only while downloading, never
while loading cask metadata. No credential is stored in this tap or the download
URL. A fine-grained token needs read access to the private repository's contents.

`brew uninstall --cask parc` removes the application; your Parc profile is
preserved. This cask does not define a destructive `zap` step.

Stable releases use increasing three-part versions and retained `v<version>`
tags. They install from a signed, notarized and stapled DMG containing Parc and
an Applications shortcut. Preview app builds do not advance the stable cask.
The cask currently remains on the 0.1.0 bootstrap. The immutable 1.0.0 candidate
failed startup and is retained as a pre-release, never eligible for promotion.
The next stable update awaits a passed 1.0.1 candidate; no DMG upgrade acceptance
is claimed yet. Release maintainers use Parc's `scripts/record-release-acceptance.py`
and `scripts/publish-homebrew.py` after Josh authorizes a ready candidate. A
passed startup receipt must bind at least 60 seconds without a new crash to
the exact commit, version and raw report hash. The publisher validates the archive digest, bundle and
report versions, notarization receipt and signed-image hashes before updating
`Casks/parc.rb`; it also verifies the DMG's Apple acceptance and mounted app
before updating its checksum. Review, check, commit and push that change.

Downloader checks:

```sh
brew ruby test/parc_download_strategy_test.rb
brew audit --cask etsenake/tap/parc
brew fetch --cask etsenake/tap/parc
```
