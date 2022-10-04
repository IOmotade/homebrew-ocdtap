require 'fileutils'
class OpenPdksAT10340x < Formula
  desc "Open PDKs v1.0.340"
  homepage "http://opencircuitdesign.com/qrouter/"
  # url "https://github.com/IOmotade/homebrew-ocdtap/raw/master/Patches/open-pdks%401.0.340/make-error-patch.tar.gz"
  # url "https://github.com/IOmotade/homebrew-ocdtap/blob/master/Patches/open-pdks@1.0.340/make-error-patch.tar.gz?raw=true"
  url "https://github.com/IOmotade/homebrew-ocdtap/raw/master/Patches/open-pdks%401.0.340/make-error-patch.tar.gz"
  # sha256 "816bb6ee32c672f5ebadb68b87a754a7d4e3f4cd438cbaa94a10c84837ef2ee2"
  sha256 "2ff6f82cb1b279e89871648d75c1ab638a694a880aa18bd788f609f03e04d743"

  livecheck do
    url :stable
    regex(%r{url=.*?/open-pdks[._-]v?(\d+(?:\.\d+)*)\.t}i)
  end

  head do
    url "git://opencircuitdesign.com/open_pdks", tag: "1.0.340"
  end

  depends_on "iomotade/ocdtap/tcltk@8.6.10" => :build
  depends_on "iomotade/ocdtap/magic@8.3" => :build
  
  depends_on "gsed" => :build
  depends_on "python" => :build
  
  def install
    # system "mkdir bin"
    Dir.chdir("bin"){
      system 'touch install_open-pdks.sh'
      system 'echo "#!/usr/bin/env bash" >> install_open-pdks.sh'
      system "echo 'python3 #{prefix}/bin/open-pdks_installer.py #{prefix} 1.0.340 \"$@\"' >> install_open-pdks.sh"
      system "echo 'chmod +x #{prefix}/bin/run_open-pdks_installer.sh' >> install_open-pdks.sh"
      system "echo '#{prefix}/bin/run_open-pdks_installer.sh' >> install_open-pdks.sh"

      bin.install "install_open-pdks.sh" => "install_open-pdks"
      bin.install "open-pdks_installer.py" => "open-pdks_installer.py"

      ohai "Run the following command to install the pdk: 'sudo install_open-pdks'"
    }
  end
end
