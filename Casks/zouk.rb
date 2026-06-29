cask "zouk" do
  # Bump alongside Resources/Info.plist's CFBundleShortVersionString in
  # woodie/zouk -- the release workflow names the zip after that value, and
  # this url template assumes the tag and the zip name agree.
  version "1.5"
  sha256 "5a9c618f174823856584e3617e9aa6f9d838cd25fed4c34045fadc4ff1329d41"

  url "https://github.com/woodie/zouk/releases/download/v#{version}/zouk-#{version}.zip"
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
