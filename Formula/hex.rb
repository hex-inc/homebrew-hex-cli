class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.07.08"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.08/hex-aarch64-apple-darwin.tar.xz"
      sha256 "e76f4536232f552a2036b2efc4856fbad8c68fdff0711ef3a271540802f6b033"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.08/hex-x86_64-apple-darwin.tar.xz"
      sha256 "93888924643cbd704eee40bf2b595ed376e68c483d7a24f55c9abb9ba42f2e29"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.08/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7b95c4c43bfaef07b6f15fa3a791588fccd630acedf68acea24074c4f6a2707c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.08/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e8b0e4b5c5016d229e5faf6657f6ce4a736840e084268421d5068b46996de8d4"
    end
  end

  def install
    bin.install "hex"
  end
end
