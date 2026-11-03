cask "hyperb" do
  version "1.4"
  sha256 "416f145d70fa7bcc86f5dc8b8115ccb8b659222f53757588a37e0a8e73541971"

  url "https://github.com/hypereffect/hyperb/releases/download/desktop-1-4/hyperb-desktop-macos-arm64-v#{version}.zip"
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
