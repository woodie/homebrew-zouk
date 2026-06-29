# homebrew-zouk

Personal Homebrew tap for [zouk](https://github.com/woodie/zouk), a native
macOS client for browsing and downloading scans from
[lambada](https://github.com/woodie/lambada)/[scandalous](https://github.com/woodie/scandalous).

```
brew tap woodie/zouk
brew install --cask zouk
```

zouk isn't signed or notarized, so the first launch hits Gatekeeper --
see the cask's `caveats` (shown after install) or
[zouk's docs/DELIVERY.md](https://github.com/woodie/zouk/blob/main/docs/DELIVERY.md)
for the "Open Anyway" steps.

## Cutting a new cask version

`Casks/zouk.rb`'s `version`/`sha256` only update when `woodie/zouk` ships a
new tagged release (its `.github/workflows/release.yml` builds and attaches
the zip; the sha256 lands in that workflow run's step summary). Bump both
fields here to match, then commit and push.
