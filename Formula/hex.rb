class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.11.12"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.12/hex-aarch64-apple-darwin.tar.xz"
      sha256 "8347b1c631ed2b4d7752dc9b378b63934ad206dec693a42848fe81ee774af305"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.12/hex-x86_64-apple-darwin.tar.xz"
      sha256 "b9c05a9aac93fd7341cfa791cfe94ed32d1640415f8306fc72370e0ca252c30b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.12/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "936b8a3f70628e609c91525c973ac53fca4b9ed288de66bb74d482067c7f972b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.12/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "18a6f35eb700d4261c062c4b2cacb48c20a162377c32ee0d1cec56654a874baa"
    end
  end

  def install
    bin.install "hex"
  end
end
