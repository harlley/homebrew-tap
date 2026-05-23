class Todomd < Formula
  desc "Agentic task manager — turns TODO.md into a visual task board"
  homepage "https://github.com/harlley/todomd"
  version "0.6.1"

  on_macos do
    on_intel do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-darwin-amd64"
      sha256 "f8712a2845d0aa5fb4e652895d1828d85a25b00a5a5334240f47e248b3f6da86"
    end
    on_arm do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-darwin-arm64"
      sha256 "20dab0fbda55523130d821b756297b60b85310b38695f13603fe51346e7c4ca2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-linux-amd64"
      sha256 "bffec1d7228354b00ed8a6a5be3bd8b0d6065d0055e1244b8e399f9c834abffa"
    end
    on_arm do
      url "https://github.com/harlley/todomd/releases/download/v#{version}/todomd-linux-arm64"
      sha256 "d0b114214b9fd1078625cadd2999df30cf05f40ef26842972e335a4bcfe63ef7"
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
