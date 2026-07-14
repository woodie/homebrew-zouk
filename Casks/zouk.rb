cask "zouk" do
  # Compound version: before_comma is the git tag's full vX.Y.Z (e.g.
  # v1.5.0 -- see existing tags in woodie/zouk for style), after_comma is
  # Resources/Info.plist's CFBundleShortVersionString (e.g. 1.5), which is
  # what `make package` names the zip after. These genuinely differ --
  # tags are three-part semver, the zip name isn't -- so a single
  # `version` used for both (the previous approach) builds a tag that
  # doesn't exist (v1.5 instead of v1.5.0) and 404s on download. Bump
  # both parts together whenever woodie/zouk cuts a new tagged release.
  version "1.12.0,1.12.0"
  sha256 "9dee389c1751a69f38a3e01a85f833c0425658864c3d4288a16a328508fcc8aa"

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
