class Addt < Formula
  desc "AI Don't Do That - Run AI coding agents in Docker containers"
  homepage "https://github.com/jedi4ever/addt"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.2/addt-darwin-arm64"
      sha256 "7a5509c0c062a93226818b530fb2fce7e9e3ba215062e520f0a148ff9a4bb238"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.2/addt-darwin-amd64"
      sha256 "49af25db39fc46b71b110c399175299d2a58f08abe75f78d7009c189bcdac9d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.2/addt-linux-arm64"
      sha256 "06fe0dad652bb1e832af61fd3bb18d41e4c2fac1918880e71d7735591133eade"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.2/addt-linux-amd64"
      sha256 "53d2a94726ce0722351ed639aff545edd02e860397915c252fac532dc412fb8b"
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
    assert_match "0.0.2", shell_output("#{bin}/addt --version 2>&1", 0)
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
