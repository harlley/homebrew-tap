cask "fluencylog" do
  version "0.2.1"
  sha256 "500ffee111c176ab070a6f17bc4403cb2d8e4d7b5e5a5d3425ad77d31427e225"

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
