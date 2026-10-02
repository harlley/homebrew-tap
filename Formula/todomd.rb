class Todomd < Formula
  desc "Web and terminal boards for shared Markdown task lists"
  homepage "https://github.com/harlley/todomd"
  version "1.0.0-rc.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://dl.todomd.dev/v#{version}/todomd-darwin-amd64.tar.gz"
      sha256 "48c1da4d083166265a6d8f5c330c0bbe88a3fcc894d953bcbc0055d02a559d63"
    end
    on_arm do
      url "https://dl.todomd.dev/v#{version}/todomd-darwin-arm64.tar.gz"
      sha256 "cb0c1a2611569bf97cbe034f51b33e3779e1d277b64e067cad85607c78b3d8a8"
    end
  end

  on_linux do
    on_intel do
      url "https://dl.todomd.dev/v#{version}/todomd-linux-amd64.tar.gz"
      sha256 "613a7b43f06b499f0c096bb759c17735bea3719cfe7169a64cac51e609d63427"
    end
    on_arm do
      url "https://dl.todomd.dev/v#{version}/todomd-linux-arm64.tar.gz"
      sha256 "f7ddaea5acdcd5c0820b6ca0104b6fbeb095c4705ce24639a3a0e17ff325fd93"
    end
  end

  def install
    bin.install "todomd"
    pkgshare.install "LICENSE"
    chmod 0755, bin/"todomd"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/todomd version").strip
    (testpath/"TODO.md").write "### Work <!-- id:list01 -->\n- [ ] Task <!-- id:task01 -->\n"
    assert_match ": ok", shell_output("#{bin}/todomd lint #{testpath}/TODO.md")
  end
end
