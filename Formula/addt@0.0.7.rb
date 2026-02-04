class AddtAT007 < Formula
  desc "Run AI coding agents safely in Docker containers"
  homepage "https://github.com/jedi4ever/addt"
  version "0.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.7/addt-darwin-arm64"
      sha256 "7811e6bd504dfaa2aaf039b826256ee49d90cc1d0e98c054087acf0069a1e272"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.7/addt-darwin-amd64"
      sha256 "0c2776c5f59d22204030a798923bb07073880635dc21d846bd309c83ac77b607"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.7/addt-linux-arm64"
      sha256 "f4450bde272e3ea6e11a48efa6ba241089559697840e685436aa66546bef203e"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.7/addt-linux-amd64"
      sha256 "69864a3649aed67bc884948f8ad6f3cbef44829d64d3d47c03061a8a3f1feb8a"
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
    assert_match "0.0.7", shell_output("#{bin}/addt --version 2>&1", 0)
  end
end
