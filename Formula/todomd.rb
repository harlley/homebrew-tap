class Todomd < Formula
  desc "Agentic task manager — turns TODO.md into a visual task board"
  homepage "https://github.com/harlley/todomd"
  version "0.9.11"

  on_macos do
    on_intel do
      url "https://dl.todomd.dev/v#{version}/todomd-darwin-amd64"
      sha256 "2d121e828d43a0b975ffc0e2b329ae58a124cc9b644c72978301e4cf7bac4f43"
    end
    on_arm do
      url "https://dl.todomd.dev/v#{version}/todomd-darwin-arm64"
      sha256 "ac8dfdc94e8d54197c0d2ebfe1511c891d2223b36ced41b98c3cedc418e00666"
    end
  end

  on_linux do
    on_intel do
      url "https://dl.todomd.dev/v#{version}/todomd-linux-amd64"
      sha256 "547746f1152dbb136aec6c78a51f740ec06be55e163514c716323bc10ca5d581"
    end
    on_arm do
      url "https://dl.todomd.dev/v#{version}/todomd-linux-arm64"
      sha256 "45a0d5891a4b53cd6847912257001ab4dcae218827f0c4f3459da665b810b9de"
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
