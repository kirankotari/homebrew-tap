class Ossguard < Formula
  include Language::Python::Virtualenv

  desc "One CLI to guard any OSS project with OpenSSF security best practices"
  homepage "https://github.com/kirankotari/ossguard"
  url "https://files.pythonhosted.org/packages/d5/be/fa431736a8cae03d76146ad1e15aa31c5c5ccb0e0d584d221614ed705b7f/ossguard-0.1.0.tar.gz"
  sha256 "a2e3c687c3ecf92eac83443955a5fc638ea868ed45d18ded04bed02421d80a14"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ossguard version")
  end
end
