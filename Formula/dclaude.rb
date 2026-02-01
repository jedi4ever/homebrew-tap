class Dclaude < Formula
  desc "Containerized Claude Code runner with Docker isolation"
  homepage "https://github.com/jedi4ever/dclaude"
  version "1.4.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.4.4/dclaude-darwin-arm64"
      sha256 "2140bf0b2e342d69fbd1caab231353a0cd9ce5689831b87f3e291e966e12d72d"
    end
    on_intel do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.4.4/dclaude-darwin-amd64"
      sha256 "4b2d14052e36b2b3e6a7e406853fae795122cb4e5653d29320d8f779409e33ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.4.4/dclaude-linux-arm64"
      sha256 "14263783c0f23d1f0b00f3cc74911e1a029a389280e3466dbcd73b34fd0661e0"
    end
    on_intel do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.4.4/dclaude-linux-amd64"
      sha256 "262d29a4286d78a8cc44d8b37ebc9e882414cb66cbac2e469492c28b11a64dd5"
    end
  end

  depends_on "docker"
  depends_on "curl"

  def install
    bin.install "dclaude-darwin-arm64" => "dclaude" if OS.mac? && Hardware::CPU.arm?
    bin.install "dclaude-darwin-amd64" => "dclaude" if OS.mac? && Hardware::CPU.intel?
    bin.install "dclaude-linux-arm64" => "dclaude" if OS.linux? && Hardware::CPU.arm?
    bin.install "dclaude-linux-amd64" => "dclaude" if OS.linux? && Hardware::CPU.intel?
  end

  test do
    assert_match "1.4.4", shell_output("#{bin}/dclaude --version 2>&1", 0)
  end

  def caveats
    <<~EOS
      dclaude requires Docker to be running.

      To get started:
        1. Ensure Docker Desktop is running
        2. Run: dclaude --version

      For authentication, you can either:
        - Run 'claude login' (uses ~/.claude config)
        - Set ANTHROPIC_API_KEY environment variable

      Documentation: https://github.com/jedi4ever/dclaude
    EOS
  end
end
