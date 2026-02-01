class DclaudeAT160 < Formula
  desc "Containerized Claude Code runner with Docker isolation"
  homepage "https://github.com/jedi4ever/dclaude"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.6.0/dclaude-darwin-arm64"
      sha256 "0fa09dacc071f437b778ed45437d3e957d1e2436c75a34b6ef9cf4b7a6ff791c"
    end
    on_intel do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.6.0/dclaude-darwin-amd64"
      sha256 "d424b92f7275da16a100e21371473516857bb9c5ae5d567db3765f77edba4cd7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.6.0/dclaude-linux-arm64"
      sha256 "ef1931603678206a13f99ccd6102ea3441f1db690634bc51945c0c0390005e9b"
    end
    on_intel do
      url "https://github.com/jedi4ever/dclaude/releases/download/v1.6.0/dclaude-linux-amd64"
      sha256 "56e6f0e85d59e0750183693f227d4a85aca535a62159f76fbd1fb451bc1e0f5b"
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
    assert_match "1.6.0", shell_output("#{bin}/dclaude --version 2>&1", 0)
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
