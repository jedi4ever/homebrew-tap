class Addt < Formula
  desc "Containerized Claude Code runner with Docker isolation"
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
      addt requires a Docker-compatible container runtime to be running.
      This can be Docker Desktop, Rancher Desktop, Podman, or any other
      Docker-compatible runtime.

      To get started:
        1. Ensure your container runtime is running
        2. Run: addt --version

      For authentication, you can either:
        - Run 'claude login' (uses ~/.claude config)
        - Set ANTHROPIC_API_KEY environment variable

      Optional: Install gh (GitHub CLI) for enhanced GitHub integration:
        brew install gh

      Documentation: https://github.com/jedi4ever/addt
    EOS
  end
end
