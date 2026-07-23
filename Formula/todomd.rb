class Todomd < Formula
  desc "Agentic task manager — turns TODO.md into a visual task board"
  homepage "https://github.com/harlley/todomd"
  version "0.9.5"

  on_macos do
    on_intel do
      url "https://dl.todomd.dev/v#{version}/todomd-darwin-amd64"
      sha256 "480cbcf2b8c0eb6c2e01cf10f428702880e9bf4e79e92abca091f56e0d9a075e"
    end
    on_arm do
      url "https://dl.todomd.dev/v#{version}/todomd-darwin-arm64"
      sha256 "34aaa2162bfc670cb9628f15fc7fd2def835b011a08944cc26d22faf7188c101"
    end
  end

  on_linux do
    on_intel do
      url "https://dl.todomd.dev/v#{version}/todomd-linux-amd64"
      sha256 "f716c46ce2838ef2492feec41970312424b64fc57bf057d88daef1e07a4b3b2d"
    end
    on_arm do
      url "https://dl.todomd.dev/v#{version}/todomd-linux-arm64"
      sha256 "0ea6c13239cdfb3a5fbcd27ff4bad84f928db57e8393aee6453ff1cac7cf0a4d"
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
