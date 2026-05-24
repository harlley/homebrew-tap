class Todomd < Formula
  desc "Agentic task manager — turns TODO.md into a visual task board"
  homepage "https://github.com/harlley/todomd"
  version "0.6.3"

  on_macos do
    on_intel do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-darwin-amd64"
      sha256 "5d6d97f10dec9983442e539bbdf31e079b3da76270f53f811d049763b2fad226"
    end
    on_arm do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-darwin-arm64"
      sha256 "6f05e31749a8fc60d8f28e2c6b14b81d5f8e4429d781a86f4f5cc44d1cef9bcc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-linux-amd64"
      sha256 "57df7c291100d1593015b7a45a19004ab309dd0762a373ca29cc6f025737e21e"
    end
    on_arm do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-linux-arm64"
      sha256 "77874762a5b981cd5413f73ce45788cec7a5fe644094485417fd3e53d8be394f"
    end
  end

  def install
    bin.install Dir["todomd-*"].first => "todomd"
  end

  def caveats
    <<~EOS
      Before uninstalling, run `todomd uninstall` to remove the skills and
      slash commands that `todomd init` placed under ~/.claude, ~/.config/opencode,
      and ~/.pi. `brew uninstall todomd` only removes the binary itself.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/todomd version")
  end
end
