cask "zouk" do
  # Compound version: before_comma is the git tag's full vX.Y.Z (e.g.
  # v1.5.0 -- see existing tags in woodie/zouk for style), after_comma is
  # Resources/Info.plist's CFBundleShortVersionString (e.g. 1.5), which is
  # what `make package` names the zip after. These genuinely differ --
  # tags are three-part semver, the zip name isn't -- so a single
  # `version` used for both (the previous approach) builds a tag that
  # doesn't exist (v1.5 instead of v1.5.0) and 404s on download. Bump
  # both parts together whenever woodie/zouk cuts a new tagged release.
  version "1.5.0,1.5"
  sha256 "5a9c618f174823856584e3617e9aa6f9d838cd25fed4c34045fadc4ff1329d41"

  url "https://github.com/woodie/zouk/releases/download/v#{version.before_comma}/zouk-#{version.after_comma}.zip"
  name "Zouk"
  desc "Native macOS client for browsing and downloading scans from lambada/scandalous"
  homepage "https://github.com/woodie/zouk"

  depends_on macos: :ventura

  app "zouk.app"

  zap trash: [
    "~/Library/Preferences/com.github.woodie.zouk.plist",
  ]

  caveats do
    <<~EOS
      zouk is not signed or notarized (see woodie/zouk's docs/DELIVERY.md).
      Homebrew quarantines downloaded casks by default, so first launch will
      hit Gatekeeper's "Apple could not verify this app is free of malware".
      Either:
        - System Settings -> Privacy & Security -> Open Anyway, after the
          first blocked launch attempt, or
        - reinstall with: brew install --cask zouk --no-quarantine
    EOS
  end
end
