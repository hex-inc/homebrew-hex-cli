class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.11.19"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.19/hex-aarch64-apple-darwin.tar.xz"
      sha256 "a4e91ce38fc55c9ee20a2fc5648fae098b9c610aa1a5bceedba3c40961853964"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.19/hex-x86_64-apple-darwin.tar.xz"
      sha256 "8cf300ebdcc77726436e0f39587660981d643de484da1e97139d406681a2d638"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.19/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "60d8739504b551b5d478ae25055892cc0bd456cdfb2c894ec03bb5cfd2101781"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.19/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6cce633552e6bbeb1cc9397bac2391e1b18cfef0b9d31513512ae66e47bb56d5"
    end
  end

  def install
    bin.install "hex"
  end
end
