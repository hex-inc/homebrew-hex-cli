class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.09.10"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.09.10/hex-aarch64-apple-darwin.tar.xz"
      sha256 "5272d72c19847499fb988285346b856cfb9c5c8a7cd15695684ba42c304e27a7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.09.10/hex-x86_64-apple-darwin.tar.xz"
      sha256 "e02b2f38da9d08744d24e3ad786aa1a381e202e8ad2a2c5664916ba25fc89037"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.09.10/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "66e3948e2186870820ec3294f72843b182469eb64541096d8c4b0f18f053ea9e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.09.10/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f7564db3a8723e3f560762bca2baa28e320456d2029d52a7617bc37cb8f7d4b7"
    end
  end

  def install
    bin.install "hex"
  end
end
