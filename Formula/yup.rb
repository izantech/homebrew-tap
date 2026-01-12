class Yup < Formula
  desc "Safe, cross-platform updater for development tools"
  homepage "https://github.com/izantech/yup"
  url "https://github.com/izantech/yup/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "f7b70e83c3e4c18d95026dc33091183b59c477bcabd4fb2d863a17c18a742109"
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
