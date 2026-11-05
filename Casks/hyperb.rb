cask "hyperb" do
  version "1.5"
  sha256 "ad021609646f11c9bc652a32e97af2d33a14bb6a073934cb4383f9b531edd017"

  url "https://github.com/hypereffect/hyperb/releases/download/desktop-1-5/hyperb-desktop-macos-arm64-v#{version}.zip"
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
