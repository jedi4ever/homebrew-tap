class AddtAT008 < Formula
  desc "Run AI coding agents safely in Docker containers"
  homepage "https://github.com/jedi4ever/addt"
  version "0.0.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.8/addt-darwin-arm64"
      sha256 "883ce90b91fd802e4aede96d5dc8734a1e3690f833df628b488c389181332b28"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.8/addt-darwin-amd64"
      sha256 "64d7c3328c17b871449babec5bc466727e127f55eeab9f5ced8cada18672c103"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.8/addt-linux-arm64"
      sha256 "cbfda37cab5a227cc5cbc5749afa03aa96e54eafb3a5ea63e87600c035de2c00"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.8/addt-linux-amd64"
      sha256 "167ae217bb249b77cdbc08339a2801ed957754ef2c08c463fab46e2fc92c3ec6"
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
    assert_match "0.0.8", shell_output("#{bin}/addt --version 2>&1", 0)
  end
end
