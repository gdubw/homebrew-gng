class Gng < Formula
  desc "Gradle is Not Gradle"
  homepage "gng.dsun.org"
  url "https://github.com/gdubw/gng/archive/v1.0.1.tar.gz"
  sha256 "e79fc0aa4c3bcde7c7394c29cb8233c47ce878bfbebc40f4d22c0c6c751b63a3"
  license "Apache-2.0"

  bottle :unneeded

  def install
    cp_r 'gradle',"#{prefix}/gradle"
    bin.install "bin/gng"
    bin.install "bin/gw"
    lib.install Dir["lib/*"]
  end

  conflicts_with "gdub",
    because: "GNG is the successor of `gdub`, Please visit https://gng.dsun.org for details"

  test do
     assert_match /No gradlew set up for this project.*/, pipe_output("#{bin}/gw 2>&1")
  end
end
