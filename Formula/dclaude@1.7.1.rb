class DclaudeAT171 < Formula
  desc "Containerized Claude Code runner with Docker isolation"
  homepage "https://github.com/jedi4ever/dclaude"
  version "1.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.7.1/dclaude-darwin-arm64"
      sha256 "63a86a564f1810645bbafb2b875fe3a422ff50177fc337752ef6504e0773c44b"
    end
    on_intel do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.7.1/dclaude-darwin-amd64"
      sha256 "8c85c38edfbcb7ddf80b9bbf074ae6096757a2a22279f1067b1d984bf66fbe6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.7.1/dclaude-linux-arm64"
      sha256 "d18e68be001e0e6cded61a558855bf8cbaac7dcda1022913de359237412d0fb7"
    end
    on_intel do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.7.1/dclaude-linux-amd64"
      sha256 "89602daf968749e1c752c7b9a5f56eda27afef464b259c19c90a4f45285c3aec"
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
    assert_match "1.7.1", shell_output("#{bin}/dclaude --version 2>&1", 0)
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
