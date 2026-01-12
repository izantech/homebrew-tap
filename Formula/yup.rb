class Yup < Formula
  desc "Safe, cross-platform updater for development tools"
  homepage "https://github.com/izantech/yup"
  url "https://github.com/izantech/yup/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "7a8a0b4edbfce31856d18036ccee1de170cdfb95da54c661fff68da1803135dd"
  license "MIT"
  head "https://github.com/izantech/yup.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--locked"
    bin.install "target/release/yup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yup --version")
  end
end
