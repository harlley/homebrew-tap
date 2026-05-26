class Todomd < Formula
  desc "Agentic task manager — turns TODO.md into a visual task board"
  homepage "https://github.com/harlley/todomd"
  version "0.6.5"

  on_macos do
    on_intel do
      url "https://dl.todomd.dev/v#{version}/todomd-darwin-amd64"
      sha256 "d363cfb8c01b31f7cebbbe3dc016179dfb7c0617d4fe4224fc8b7a58ce246e8a"
    end
    on_arm do
      url "https://dl.todomd.dev/v#{version}/todomd-darwin-arm64"
      sha256 "379ce5602bfb1f219a5c712f7ddc81ae6b83e4bebe25936b33499650573669fd"
    end
  end

  on_linux do
    on_intel do
      url "https://dl.todomd.dev/v#{version}/todomd-linux-amd64"
      sha256 "6a6d17e2430e71ad5f21e82b0aec8c666d7107506b4014e0c1f571b8bfbb40b3"
    end
    on_arm do
      url "https://dl.todomd.dev/v#{version}/todomd-linux-arm64"
      sha256 "cbd6d87441a7c690f6d6665d396c02e3e474394320d22ed35037d1284e737f39"
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
