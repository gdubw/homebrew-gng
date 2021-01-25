class Gng < Formula
  desc "Gradle is Not Gradle"
  homepage "gng.dsun.org"
  url "https://github.com/gdubw/gng/archive/v1.0.1.tar.gz"
  sha256 "867d7ff879c88f360b677d4fa42aae23c90f38bc427fbe370b6010ff5169d177"
  license "Apache-2.0"

  bottle :unneeded

  def install
    cp_r 'gradle',"#{prefix}/gradle"
    bin.install "bin/gng"
    bin.install "bin/gw"
    lib.install Dir["lib/*"]
  end

  conflicts_with "gdub"
    because: "GNG is providing the accessor of `gdub`, Please visit https://gng.dsun.org for details"

  test do
     assert_match "[ERROR] No gradlew set up for this project; *", pipe_output("#{bin}/gw 2>&1")
  end
end
