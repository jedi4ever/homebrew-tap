class AddtAT005 < Formula
  desc "Run AI coding agents safely in Docker containers"
  homepage "https://github.com/jedi4ever/addt"
  version "0.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.5/addt-darwin-arm64"
      sha256 "adf2fc399f28f504934538db4958f624b5d212038db08f4d1fccfeb0170f392b"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.5/addt-darwin-amd64"
      sha256 "040d2b5083fd072c6e2a0f98d8b5381c34b0b9f7a6af9171a5a7ff414533d02c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.5/addt-linux-arm64"
      sha256 "107eb5b4993cc0d1f5420d21af4e0b151cd6c823b13ab7286423d620897a617c"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.5/addt-linux-amd64"
      sha256 "573c4c0c6ced455b1b1afa1b72342db0f11b6045b1cc3fdc23055cf5159c6436"
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
    assert_match "0.0.5", shell_output("#{bin}/addt --version 2>&1", 0)
  end
end
