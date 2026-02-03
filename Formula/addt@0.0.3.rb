class AddtAT003 < Formula
  desc "AI Don't Do That - Run AI coding agents in Docker containers"
  homepage "https://github.com/jedi4ever/addt"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.3/addt-darwin-arm64"
      sha256 "0ebcbcd280709842f6d6ab91a4d4e7ba629eaab65a0067317f3a5bba9e480ea4"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.3/addt-darwin-amd64"
      sha256 "c71e2d8f329e7d5d679607f3637ab3a5c6e6322de0434fbcb4daba2fbe277416"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.3/addt-linux-arm64"
      sha256 "fc888f848fa87e9abeb1abb62e626734a6f2b76a81a6da4202333fe262d92ab1"
    end
    on_intel do
      url "https://github.com/jedi4ever/addt/releases/download/v0.0.3/addt-linux-amd64"
      sha256 "ab3d530a10654188df3d45a13ac4cc19a167a3630e9c13cf4b3ca70a87ea1fc2"
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
    assert_match "0.0.3", shell_output("#{bin}/addt --version 2>&1", 0)
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
