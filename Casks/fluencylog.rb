cask "fluencylog" do
  version "0.2.2"
  sha256 "41414e2969ec57eacbed8dd86a15f60a07d889db64baea7b24868c32a927ed22"

  url "https://pub-94ef814e66fc41739ec9d9211dc07e04.r2.dev/FluencyLog-#{version}-macos.zip"
  name "FluencyLog"
  desc "Native macOS English fluency coach with hotkey popup"
  homepage "https://github.com/harlley/fluencylog"

  depends_on macos: :sonoma
  auto_updates false

  app "FluencyLog.app"

  zap trash: [
    "~/Library/Application Support/com.fluencylog",
    "~/Library/Preferences/com.fluencylog.plist",
  ]
end
