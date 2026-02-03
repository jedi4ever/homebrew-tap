class AddtAT004 < Formula
  desc "AI Don't Do That - Run AI coding agents in Docker containers"
  homepage "https://github.com/jedi4ever/addt"
  version "0.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.4/addt-darwin-arm64"
      sha256 "4bd662862d0faf52929f0cf1a5d1cf547b16db260a4610d3de62676892c652f4"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.4/addt-darwin-amd64"
      sha256 "b65d576fbaa892e9bca785cf1851cec0bb45fdcfd51a3a2594cdfc957006ad84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.4/addt-linux-arm64"
      sha256 "694d128f21666b22db8dc98a21b86dc551ae6b2465e277977b222c5d3a125807"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.4/addt-linux-amd64"
      sha256 "5ec2dbee85109a41e1b8df8fc525df0895c9e5ca49432a05283fa2fa316991e7"
    end
  end

  depends_on "curl"

  def install
    bin.install "addt-darwin-arm64" => "addt" if OS.mac? && Hardware::CPU.arm?
    bin.install "addt-darwin-amd64" => "addt" if OS.mac? && Hardware::CPU.intel?
    bin.install "addt-linux-arm64" => "addt" if OS.linux? && Hardware::CPU.arm?
    bin.install "addt-linux-amd64" => "addt" if OS.linux? && Hardware::CPU.intel?
  end

  test do
    assert_match "0.0.4", shell_output("#{bin}/addt --version 2>&1", 0)
  end

  def caveats
    <<~EOS
      addt (AI Don't Do That) runs AI coding agents in Docker containers.
      Your agent can read, write, and execute code in complete isolation.

      Prerequisites:
        - Docker (or compatible runtime like Rancher Desktop, Podman)

      Quick start:
        addt --addt-version         # Shows addt version
        addt --addt-list-extensions # List available agents (claude, codex, gemini)

      Use as specific agent via symlinks:
        ln -s $(which addt) ~/bin/claude
        ln -s $(which addt) ~/bin/codex

      Authentication (choose one):
        - Run 'claude login' locally (config auto-mounted)
        - Set ANTHROPIC_API_KEY environment variable

      Optional: brew install gh (for GitHub integration)

      Documentation: https://github.com/jedi4ever/addt
    EOS
  end
end
