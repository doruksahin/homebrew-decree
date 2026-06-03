# Homebrew formula for decree (https://github.com/doruksahin/decree).
#
# decree is distributed from GitHub Releases, not PyPI (the PyPI name `decree`
# belongs to an unrelated third-party project). This formula builds a dedicated
# virtualenv and pip-installs decree from the release sdist, letting pip resolve
# decree's dependencies (pydantic, networkx, mcp, scipy, scikit-learn, …) from
# PyPI wheels at install time. Vendoring those heavy scientific deps as Homebrew
# `resource` blocks is impractical, so this is a deliberate custom-tap formula
# (plain pip, no pinned resources) and is not intended for homebrew-core.
#
# url/sha256 below are placeholders until the first `vX.Y.Z` release; decree's
# release workflow (the `homebrew` job) rewrites both lines on every release.
class Decree < Formula
  include Language::Python::Virtualenv

  desc "Software decision lifecycle toolkit for PRDs, ADRs, and SPECs"
  homepage "https://github.com/doruksahin/decree"
  url "https://github.com/doruksahin/decree/releases/download/v1.0.0/decree-1.0.0.tar.gz"
  sha256 "f8ed33fdc0b8515171390c914db401f4928571c1cbee808610a7fd49fa2f7086"
  license "MIT"

  depends_on "python@3.13"

  def install
    # virtualenv_create gives us the venv; install with plain pip (not the
    # resource-vendoring DSL, which passes --no-deps) so decree's dependencies
    # resolve from PyPI wheels.
    virtualenv_create(libexec, "python3.13")
    system libexec/"bin/pip", "install", "--verbose", buildpath
    bin.install_symlink libexec/"bin/decree"
  end

  test do
    assert_match "decree", shell_output("#{bin}/decree --version")
  end
end
