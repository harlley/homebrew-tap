class Todomd < Formula
  desc "Agentic task manager — turns TODO.md into a visual task board"
  homepage "https://github.com/harlley/todomd"
  version "0.9.2"

  on_macos do
    on_intel do
      url "https://dl.todomd.dev/v#{version}/todomd-darwin-amd64"
      sha256 "5fff1fd80f223d44c186ff7683eb414034dadae210e40b9e1944a774eb03fab7"
    end
    on_arm do
      url "https://dl.todomd.dev/v#{version}/todomd-darwin-arm64"
      sha256 "83dbf56e5387672a4f077910f0349fc49775300bcd4b518e8e3a9e0d9435ed78"
    end
  end

  on_linux do
    on_intel do
      url "https://dl.todomd.dev/v#{version}/todomd-linux-amd64"
      sha256 "b6e43c4a79c3c22fe0398cba5884e3d5b673f20d8e1463840ef4a221fddded22"
    end
    on_arm do
      url "https://dl.todomd.dev/v#{version}/todomd-linux-arm64"
      sha256 "5ee9d780c24011c0bb14702b537b8bba946ae5c438d56baa2d01c1234e23f771"
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
