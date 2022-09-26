class AdmsAT236 < Formula
  desc "ADMS v2.3.6 Code Generator for Verilog-AMS with Spice API"
  homepage "https://sourceforge.net/projects/mot-adms/"
  url "https://sourceforge.net/projects/mot-adms/files/adms-source/2.3/adms-2.3.6.tar.gz/download"
  sha256 "7307e8c63967696209c514545001fa496538112af7b812958950b22e0d45c9e6"

  livecheck do
    url :stable
    regex(%r{url=.*?/adms[._-]v?(\d+(?:\.\d+)*)\.t}i)
  end

  head do
    url "https://github.com/Qucs/ADMS.git", tag: "release-2.3.6"
  
    depends_on "bison" => :build
  end

  def install
    
    #system "echo $PWD"
    system "./bootstrap.sh" if build.head?
    
    args = %W[
      --prefix=#{prefix}
      YACC=/opt/homebrew/opt/bison@3.8/bin/bison
      BISON=/opt/homebrew/opt/bison@3.8/bin/bison
    ]
    
    system "./configure", *args
    system "make", "install"

    # remove conflict lib files with libngspice
    rm_rf Dir[lib/"adms"]
  end

end
