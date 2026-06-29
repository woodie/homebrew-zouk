cask "zouk" do
  # Compound version: before_comma is the git tag's full vX.Y.Z (e.g.
  # v1.5.0 -- see existing tags in woodie/zouk for style), after_comma is
  # Resources/Info.plist's CFBundleShortVersionString (e.g. 1.5), which is
  # what `make package` names the zip after. These genuinely differ --
  # tags are three-part semver, the zip name isn't -- so a single
  # `version` used for both (the previous approach) builds a tag that
  # doesn't exist (v1.5 instead of v1.5.0) and 404s on download. Bump
  # both parts together whenever woodie/zouk cuts a new tagged release.
  version "1.6.0,1.6"
  sha256 "45cb09f3a78d269163938aeffb4f29da434217f137abf7d2a907c818a7c642b2"

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
      zouk is signed and notarized, so it installs and launches with no
      Gatekeeper warning -- just the routine one-time "downloaded from
      the Internet" notice macOS shows on any first launch.
    EOS
  end
end
