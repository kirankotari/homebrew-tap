class Ossguard < Formula
  desc "One CLI to guard any OSS project with OpenSSF security best practices"
  homepage "https://github.com/kirankotari/ossguard-go"
  url "https://github.com/kirankotari/ossguard-go/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "d2cb89e94513ace850c94fc0841ce9536cc11c774a3132df1e2063fecf7798ba"
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
