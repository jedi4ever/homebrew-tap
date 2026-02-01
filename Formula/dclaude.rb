class Dclaude < Formula
  desc "Containerized Claude Code runner with Docker isolation"
  homepage "https://github.com/jedi4ever/dclaude"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.5.0/dclaude-darwin-arm64"
      sha256 "55662b40985665c8bba4e2ceae133772e1b01d72357022805e422e2a6a67d5d0"
    end
    on_intel do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.5.0/dclaude-darwin-amd64"
      sha256 "d68376e05d87339f1450c1bcad73440208d97f5a4f45293551a530cc523bb170"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.5.0/dclaude-linux-arm64"
      sha256 "d1b9e75cb416bf464121587316457fb8c49c5d6f6a61d92da5587a202e2e7089"
    end
    on_intel do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.5.0/dclaude-linux-amd64"
      sha256 "27b7dd42eab1713e5eaaef073d395d7eadb79c45c535954d3536ea2b7c0188e0"
    end
  end

  depends_on "curl"

  def install
    bin.install "dclaude-darwin-arm64" => "dclaude" if OS.mac? && Hardware::CPU.arm?
    bin.install "dclaude-darwin-amd64" => "dclaude" if OS.mac? && Hardware::CPU.intel?
    bin.install "dclaude-linux-arm64" => "dclaude" if OS.linux? && Hardware::CPU.arm?
    bin.install "dclaude-linux-amd64" => "dclaude" if OS.linux? && Hardware::CPU.intel?
  end

  test do
    assert_match "1.5.0", shell_output("#{bin}/dclaude --version 2>&1", 0)
  end

  def caveats
    <<~EOS
      dclaude requires a Docker-compatible container runtime to be running.
      This can be Docker Desktop, Rancher Desktop, Podman, or any other
      Docker-compatible runtime.

      To get started:
        1. Ensure your container runtime is running
        2. Run: dclaude --version

      For authentication, you can either:
        - Run 'claude login' (uses ~/.claude config)
        - Set ANTHROPIC_API_KEY environment variable

      Optional: Install gh (GitHub CLI) for enhanced GitHub integration:
        brew install gh

      Documentation: https://github.com/jedi4ever/dclaude
    EOS
  end
end
