class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.07.28"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.28/hex-aarch64-apple-darwin.tar.xz"
      sha256 "8ea1dde81c400840874e3e481e3ac76be21262c8c30db951b6bd53e6a77dbaa5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.28/hex-x86_64-apple-darwin.tar.xz"
      sha256 "510f18297c8fe8acc64951bec1654258173e99b548209191deb6d091b36f3f1b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.28/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8368e56c2fd2e56e3d81f3647f80e7282cb40f3ed0e2822f1cd676be773e8113"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.28/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f228efeb5577f468629fcce7c96b9890618f860aae804239568a8ec1ca541c40"
    end
  end

  def install
    bin.install "hex"
  end
end
