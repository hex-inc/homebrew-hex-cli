class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.09.01"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.09.01/hex-aarch64-apple-darwin.tar.xz"
      sha256 "809206190f2566138bb4b80ce430efcb932589d38c21622aee76d546646210ae"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.09.01/hex-x86_64-apple-darwin.tar.xz"
      sha256 "55619fb10dae410481fe250b46753a6b9d67c6045249d29b3c32877cf2f881ca"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.09.01/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a60c6f3ba43806662630cb0331daa9fa7833c6bafa1a4d47cf8f9968f271485c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.09.01/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "18c9f963ff52554d76e151b82658ab095116616bbca2ec2b78ad2306d454aaba"
    end
  end

  def install
    bin.install "hex"
  end
end
