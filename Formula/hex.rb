class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.06.02"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.06.02/hex-aarch64-apple-darwin.tar.xz"
      sha256 "65111c7d93cf1397e055d6eac28138c2f0f63e0a2d8b824574b0b88318b3f457"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.06.02/hex-x86_64-apple-darwin.tar.xz"
      sha256 "bd44c91929f116b90483d3307c1034772fe0ad65d4376b9f765b95f3c457a50c"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.06.02/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ae3fa56686baa447d3f4486906ab1be6f103724166c4f755e3082ee9d7024ed2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.06.02/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b6b1a31aa8c47d8a8965da9c6e554121a516ebf7623d41b5f54afcb4f6435845"
    end
  end
  def install
    bin.install "hex"
  end
end
