class Todomd < Formula
  desc "Agentic task manager — turns TODO.md into a visual task board"
  homepage "https://github.com/harlley/todomd"
  version "0.8.0"

  on_macos do
    on_intel do
      url "https://dl.todomd.dev/v#{version}/todomd-darwin-amd64"
      sha256 "2ffe8dc4368fa96b069cf51e375fcd12fb5cded12692d1d952f93f9a485882f7"
    end
    on_arm do
      url "https://dl.todomd.dev/v#{version}/todomd-darwin-arm64"
      sha256 "3f35f67bd450597a64a0a3e7f75343cda8bd024f2a5a2c0b45d4cb834841d7b1"
    end
  end

  on_linux do
    on_intel do
      url "https://dl.todomd.dev/v#{version}/todomd-linux-amd64"
      sha256 "a8b699600d1c1c56f858e92e82e87586d3dad795ef9da588f2d006c9e126ae44"
    end
    on_arm do
      url "https://dl.todomd.dev/v#{version}/todomd-linux-arm64"
      sha256 "6ff23367b3e7ee6aec8133f86f9d672ba39d24c8b046eae026392dd91b523f69"
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
