cask "fluencylog" do
  version "0.2.2"
  sha256 "41414e2969ec57eacbed8dd86a15f60a07d889db64baea7b24868c32a927ed22"

  url "https://pub-94ef814e66fc41739ec9d9211dc07e04.r2.dev/FluencyLog-#{version}-macos.zip"
  name "FluencyLog"
  desc "English fluency coach with hotkey popup"
  homepage "https://github.com/harlley/fluencylog"

  auto_updates false
  depends_on macos: :sonoma

  app "FluencyLog.app"

  postflight do
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/FluencyLog.app"]
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/FluencyLog.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.fluencylog",
    "~/Library/Preferences/com.fluencylog.plist",
  ]
end
