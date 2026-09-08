class Todomd < Formula
  desc "Agentic task manager — turns TODO.md into a visual task board"
  homepage "https://github.com/harlley/todomd"
  version "1.0.0-rc.1"

  on_macos do
    on_intel do
      url "https://dl.todomd.dev/v#{version}/todomd-darwin-amd64"
      sha256 "4557a18d0e8b109ab0a08e6b93d109a8bd9e9d2f32fa42017267902d09636093"
    end
    on_arm do
      url "https://dl.todomd.dev/v#{version}/todomd-darwin-arm64"
      sha256 "2e16594113929dfe82b7b19dadfe0e40683cb6095623d43f77dbda7feb118568"
    end
  end

  on_linux do
    on_intel do
      url "https://dl.todomd.dev/v#{version}/todomd-linux-amd64"
      sha256 "f0468de35d3954882729dba9ef88948323940fa5cfe323d10964305d49942180"
    end
    on_arm do
      url "https://dl.todomd.dev/v#{version}/todomd-linux-arm64"
      sha256 "2413deb95d6803bac5e8070d7b578c712e62f30fc7740f364773df4af0b9991b"
    end
  end

  def install
    bin.install cached_download => "todomd"
    chmod 0755, bin/"todomd"
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
