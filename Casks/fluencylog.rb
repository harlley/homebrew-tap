cask "fluencylog" do
  version "0.1.3"
  sha256 "ed44c787d09f4f310694eb237102b0d479814f37f6dd7e44d4347971d30d0601"

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
