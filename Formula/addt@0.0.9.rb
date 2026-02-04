class AddtAT009 < Formula
  desc "Run AI coding agents safely in Docker containers"
  homepage "https://github.com/jedi4ever/addt"
  version "0.0.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.9/addt-darwin-arm64"
      sha256 "95fab62be4a29145474f04cbc085acb98b6526b81092adea2341b0d5302bb4f7"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.9/addt-darwin-amd64"
      sha256 "3533ccf99d6935f493066982daf5d2451c42e30062d0484b3bcf0626693f0c64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.9/addt-linux-arm64"
      sha256 "bfbfafd4f7bb482f59f4b6861d109d9f12d589fe8e42fca0686b5547fa0f5a99"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.9/addt-linux-amd64"
      sha256 "792cd90d260a001f32f936c4f6d83d3d9dd3c964846fe78ae29182f878c51f9b"
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
    assert_match "0.0.9", shell_output("#{bin}/addt --version 2>&1", 0)
  end
end
