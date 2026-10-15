class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.10.15"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.15/hex-aarch64-apple-darwin.tar.xz"
      sha256 "5669ed660f1628aaf915bfe1c51f3d144eefdbe3c5cf31d12aa99a32b90e5736"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.15/hex-x86_64-apple-darwin.tar.xz"
      sha256 "4ebd50a9cab9cb4330534e7a04fee8bc582a03a263d4dd912066b6d9d4a1994d"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.15/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a425ecf8af68f01755c966a96a179c3d7d862da6d0dbf689f93f1a96c1d75eea"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.15/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d729584136d553f7bc82f898469cfcf3a14d3ccd5bf1d79bc6cc5650625e7db8"
    end
  end

  def install
    bin.install "hex"
  end
end
