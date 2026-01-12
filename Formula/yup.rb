class Yup < Formula
  desc "Safe, cross-platform updater for development tools"
  homepage "https://github.com/izantech/yup"
  url "https://github.com/izantech/yup/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "149cdffbae9d979251bbb4114cd2e818978c65666ac14b9165dd7fd1e71bf72b"
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
