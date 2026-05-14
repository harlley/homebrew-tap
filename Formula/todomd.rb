class Todomd < Formula
  desc "Agentic task manager — turns TODO.md into a visual task board"
  homepage "https://github.com/harlley/todomd"
  version "0.6.0"

  on_macos do
    on_intel do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-darwin-amd64"
      sha256 "7a6c7d078d1ab4cd4299a5ffba069f291a41a657fa5ae2ade2a45808388678ef"
    end
    on_arm do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-darwin-arm64"
      sha256 "f9b52a38e7fae67e4d15693ef83eb2468c016f9214f18863d0300c1266f3ed1c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-linux-amd64"
      sha256 "957a8f2ee29350e9406e10159dc682e35570011465bd24b9c959f104c1e0437d"
    end
    on_arm do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-linux-arm64"
      sha256 "c64beccaebc07497eabfc8df2f7370f2cdcc3a51639d5d7887c31c80205cb0ee"
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
