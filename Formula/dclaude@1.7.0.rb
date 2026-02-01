class DclaudeAT170 < Formula
  desc "Containerized Claude Code runner with Docker isolation"
  homepage "https://github.com/jedi4ever/dclaude"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.7.0/dclaude-darwin-arm64"
      sha256 "fbe8fca03ee12d0dd08c9a5411c2d3f0059df216948e64cfa7bfc67d96205e8a"
    end
    on_intel do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.7.0/dclaude-darwin-amd64"
      sha256 "9d407c9b91520b40453c4f161b228e5afe8eee30250e6fad1f629716ae2c89b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.7.0/dclaude-linux-arm64"
      sha256 "53cd219f17081af4b2a085c4467996c0dc7076b48d88ac28d632cbc8133328f9"
    end
    on_intel do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.7.0/dclaude-linux-amd64"
      sha256 "f68658db72aef1e91120230e25b622209e97a8f4c7a2ecaca531dd7db15447dd"
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
    assert_match "1.7.0", shell_output("#{bin}/dclaude --version 2>&1", 0)
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
