class Gng < Formula
  desc "Gradle is Not Gradle"
  homepage "https://gng.dsun.org"
  url "https://github.com/gdubw/gng/archive/v1.0.5.tar.gz"
  sha256 "5177eb851895b26e8bf45c8e9e036da53ea89d5df0572560f116c22bc37dc809"
  license "Apache-2.0"

  depends_on "gettext"

  conflicts_with "gdub",
    because: "GNG is the accessor of `gdub`, Please visit https://gng.dsun.org for details"

  def install
    cp_r "gradle", "#{prefix}/gradle"
    bin.install "bin/gng"
    bin.install "bin/gw"
    lib.install Dir["lib/*"]
  end

  def post_install
    ohai <<~FOO
      To avoid using any system wide Gradle distribution add a gradle alias to gw to your shell’s configuration file.

      echo "alias gradle=gw" >> ~/.bashrc
      echo "export PATH=/usr/local/bin:${PATH}" >> ~/.bashrc
      source ~/.bashrc

    FOO
  end

  test do
    assert_match(/No gradlew set up for this project.*/, pipe_output("#{bin}/gw 2>&1"))
  end
end
