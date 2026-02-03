class AddtAT001 < Formula
  desc "AI Don't Do That - Run AI coding agents in Docker containers"
  homepage "https://github.com/jedi4ever/addt"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.1/addt-darwin-arm64"
      sha256 "4d7cce27eae38b5f7637cc082b2afae848c34e3c337938580afe00c753392e33"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.1/addt-darwin-amd64"
      sha256 "cba7921e26c2d90fb6c5ceece34c64b4feda416fa04956b33d96e430ff5e5af7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.1/addt-linux-arm64"
      sha256 "5a7faa26ce9ad459d18e99d31f5e5ef8202ea4786d612e3999eaf463e8e742c3"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.1/addt-linux-amd64"
      sha256 "fb9ab55b85cb257bca1c571b34b64225da8d71533cdbafe841c5f45fbfae370e"
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
    assert_match "0.0.1", shell_output("#{bin}/addt --version 2>&1", 0)
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
