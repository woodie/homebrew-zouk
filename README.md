# homebrew-zouk

Personal Homebrew tap for [zouk](https://github.com/woodie/zouk), a native
macOS client for browsing and downloading scans from
[lambada](https://github.com/woodie/lambada)/[scandalous](https://github.com/woodie/scandalous).

```
brew tap woodie/zouk
brew install --cask zouk
```

zouk is signed and notarized, so it installs and launches with no
Gatekeeper warning -- see
[zouk's docs/DELIVERY.md](https://github.com/woodie/zouk/blob/main/docs/DELIVERY.md)
for details.

## Upgrading

```
brew update
brew upgrade --cask zouk
```

`brew upgrade` alone won't pick up a new version -- it checks against
this tap's local clone, which only refreshes on `brew update`. Skipping
that step either no-ops or, if a version bump just landed, fails with a
checksum mismatch against the stale cached cask.

## Cutting a new cask version

`Casks/zouk.rb`'s `version`/`sha256` only update when `woodie/zouk` ships a
new tagged release (its `.github/workflows/release.yml` builds and attaches
the zip; the sha256 lands in that workflow run's step summary).

`version` is a compound value: the part before the comma is the git tag's
full `vX.Y.Z` (e.g. `1.5.0`), the part after is
`Resources/Info.plist`'s `CFBundleShortVersionString` (e.g. `1.5`), which
is what `make package` names the zip after. They're genuinely different
strings -- tags are three-part semver, the zip name isn't -- so both need
bumping together, matching the new tag and the plist value it was cut
from. Update `sha256` to match, then commit and push.
