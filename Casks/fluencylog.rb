cask "fluencylog" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/harlley/fluencylog/releases/download/v#{version}/FluencyLog-#{version}-macos.zip"
  name "FluencyLog"
  desc "Native macOS English fluency coach with hotkey popup"
  homepage "https://github.com/harlley/fluencylog"

  depends_on macos: ">= :sonoma"
  auto_updates false

  app "FluencyLog.app"

  zap trash: [
    "~/Library/Application Support/com.fluencylog",
    "~/Library/Preferences/com.fluencylog.plist",
  ]
end
