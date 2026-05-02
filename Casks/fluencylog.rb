cask "fluencylog" do
  version "0.1.4"
  sha256 "274efb73ea0a099f4d9196ec6c1a95e559eaafcd7f5699bb8ee146ce0cfe4007"

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
