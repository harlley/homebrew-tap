class Todomd < Formula
  desc "Agentic task manager — turns TODO.md into a visual task board"
  homepage "https://github.com/harlley/todomd"
  version "0.6.2"

  on_macos do
    on_intel do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-darwin-amd64"
      sha256 "2e2f4abe6c610163384e74bf365580072722b3c18ce973e1a6e69ddcd657f0db"
    end
    on_arm do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-darwin-arm64"
      sha256 "dcf1430a409300e1269205dfa34c424d50d1e627f349eacffa6c610aa9609ae2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-linux-amd64"
      sha256 "b52b5b7c6b0a9297e0fd959e5a34f97ad93391e737abf639122094c5af8018e3"
    end
    on_arm do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-linux-arm64"
      sha256 "af924a018d5add8cc4045a3b00f6e6aa6acf7ae47199e5995cc34f75d447e07f"
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
