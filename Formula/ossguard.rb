class Ossguard < Formula
  include Language::Python::Virtualenv

  desc "One CLI to guard any OSS project with OpenSSF security best practices"
  homepage "https://github.com/kirankotari/ossguard"
  url "https://github.com/kirankotari/ossguard/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "18e5378c90d643f39f7a42b17405880db0ef4f7d8db92234232ad5d24fa11096"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ossguard version")
  end
end
