class Ossguard < Formula
  desc "One CLI to guard any OSS project with OpenSSF security best practices"
  homepage "https://github.com/kirankotari/ossguard-go"
  url "https://github.com/kirankotari/ossguard-go/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cc5c0ff0d3eb4118125f8dd0eeacd67c551a76a1a9ab74ce98b609c2cd076d67"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/ossguard"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ossguard version")
  end
end
