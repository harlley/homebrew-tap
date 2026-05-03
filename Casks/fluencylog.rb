cask "fluencylog" do
  version "0.2.0"
  sha256 "b4a5eb58c21eff0e8598bd2ca07871919ee9ee27ac468b6469f20b87892c0345"

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
