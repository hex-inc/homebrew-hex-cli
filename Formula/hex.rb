class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.07.09"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.09/hex-aarch64-apple-darwin.tar.xz"
      sha256 "155569c5a00428752488cd74e7b416a3832882f3764c7b5dadba6fe205e8640a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.09/hex-x86_64-apple-darwin.tar.xz"
      sha256 "4ec9123c64e75e0d03baeeea811431eed69e19b83c6f8081388014c88e80ed0f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.09/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "94c38517dfd483b75176ada3567edb0ef233041eb439dd30a9cb604e413437ca"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.09/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5a0cc15bae66e42803016d10d1dc6a4aa84feefe42c02e4636921c7328531963"
    end
  end

  def install
    bin.install "hex"
  end
end
