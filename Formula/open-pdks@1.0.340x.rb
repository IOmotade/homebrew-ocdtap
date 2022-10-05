require 'fileutils'
class OpenPdksAT10340x < Formula
  desc "Open PDKs v1.0.340"
  homepage "http://opencircuitdesign.com/open_pdks/"
  url "https://github.com/IOmotade/homebrew-ocdtap/raw/master/Patches/open-pdks%401.0.340/make-error-patch.tar.gz"
  sha256 "2a24a902a67cedc144e56c78245e4180e13a9f623f3af6981a9fb62f809d953c"

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
    Dir.chdir("bin"){
      system 'touch install_open-pdks.sh'
      system 'echo "#!/usr/bin/env bash" >> install_open-pdks.sh'
      system "echo 'python3 #{prefix}/bin/open-pdks_installer.py #{prefix} 1.0.340 \"$@\"' >> install_open-pdks.sh"
      system "echo 'chmod +x #{prefix}/bin/run_open-pdks_installer.sh' >> install_open-pdks.sh"
      system "echo '#{prefix}/bin/run_open-pdks_installer.sh' >> install_open-pdks.sh"
      
      system 'touch uninstall_open-pdks.sh'
      system 'echo "#!/usr/bin/env bash" >> uninstall_open-pdks.sh'
      system "echo 'rm -rf #{prefix}/share' >> uninstall_open-pdks.sh"

      bin.install "install_open-pdks.sh" => "install_open-pdks"
      bin.install "uninstall_open-pdks.sh" => "uninstall_open-pdks"
      bin.install "open-pdks_installer.py" => "open-pdks_installer.py"

      ohai "Run the following command to install the pdk: 'sudo install_open-pdks'"
      ohai "Before running 'brew remove' also run: 'sudo uninstall_open-pdks'"
    }
  end
end
