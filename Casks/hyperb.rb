cask "hyperb" do
  version "1.6"
  sha256 "d1cb11c67a119fe778a7d3fe4d1716f378281acd79e7672de103913f4bba7534"

  url "https://github.com/hypereffect/hyperb/releases/download/desktop-1-6/hyperb-desktop-macos-arm64-v#{version}.zip"
  name "hyperb"
  desc "A browser for hypereffect apps"
  homepage "https://github.com/hypereffect/hyperb"

  depends_on arch: :arm64

  app "hyperb.app"

  # the app is unsigned, so clear the quarantine flag instead of making users do it
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/hyperb.app"]
  end

  zap trash: [
    "~/.config/hyperb",
    "~/.local/share/hyperb",
    "~/Library/Caches/hyperb",
  ]
end
