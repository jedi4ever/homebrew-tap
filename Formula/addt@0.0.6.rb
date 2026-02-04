class AddtAT006 < Formula
  desc "Run AI coding agents safely in Docker containers"
  homepage "https://github.com/jedi4ever/addt"
  version "0.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.6/addt-darwin-arm64"
      sha256 "76135561999e3708bdf833cd7a01add4b6d7dbefa07cc95dd4b3d03455ed66ee"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.6/addt-darwin-amd64"
      sha256 "4ec8d71e4838371ef2e7e852d3a02054f70758c3eaa032e451157c55f8531d3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.6/addt-linux-arm64"
      sha256 "67173262dae0aedfcfb0c220e801dae1d51ed53d5f529acee7539399e374dbe2"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.6/addt-linux-amd64"
      sha256 "c237bc4096b7a9f3b3ea86f97e158a6c6d1509e828ae4910d7bfe17bfbfafa23"
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
    assert_match "0.0.6", shell_output("#{bin}/addt --version 2>&1", 0)
  end
end
