class Yup < Formula
  desc "Safe, cross-platform updater for development tools"
  homepage "https://github.com/izantech/yup"
  url "https://github.com/izantech/yup/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "1608e3f6cd88a3714f4836a4db98a4333dc8e8495962dd12b75e791a89120fa6"
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
