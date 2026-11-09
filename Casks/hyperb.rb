cask "hyperb" do
  version "1.7"
  sha256 "ff1107bc23059489dce72e99b742ae77f34e28ded44c404fa11327c4cd0f89f5"

  url "https://github.com/hypereffect/hyperb/releases/download/desktop-1-7/hyperb-desktop-macos-arm64-v#{version}.zip"
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
