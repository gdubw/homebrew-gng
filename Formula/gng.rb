class Gng < Formula
  desc "Gradle is Not Gradle"
  homepage "https://gng.dsun.org"
  url "https://github.com/gdubw/gng/archive/v1.0.3.tar.gz"
  sha256 "2ae84cedf372e50beea12f5ef13ee58892c87b0bea379709e34b01df6b5a255c"
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
