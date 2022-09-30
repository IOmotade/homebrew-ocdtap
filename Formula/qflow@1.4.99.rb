class QflowAT1499 < Formula
  desc "QFlow v1.4.99: A Digital Synthesis Flow using Open Source EDA Tools"
  homepage "http://opencircuitdesign.com/qflow/"
  url "http://opencircuitdesign.com/qflow/archive/qflow-1.4.99.tgz"
  sha256 "8e5e506b265317344a9192e19d77a618d43ea520937153dc27fb04994674cf0f"

  livecheck do
    url :stable
    regex(%r{url=.*?/qflow[._-]v?(\d+(?:\.\d+)*)\.t}i)
  end

  head do
    url "git://opencircuitdesign.com/qflow", tag: "1.4.99"
  end
  
  depends_on "iomotade/ocdtap/tcltk@8.6.10" => :build
  depends_on "yosys" => :build
  depends_on "iomotade/ocdtap/graywolf@0.1.6" => :build
  depends_on "iomotade/ocdtap/qrouter@1.4.85" => :build
  depends_on "iomotade/ocdtap/magic@8.3" => :build
  depends_on "iomotade/ocdtap/netgen@1.5" => :build
  
  depends_on "python-tk" => :build

  depends_on "glfw" => :build
  depends_on "glew" => :build

  def install
        
    args = %W[
      --prefix=#{prefix}
      --with-tclsh
      --with-magic
      --with-netgen
      --with-qrouter
      --with-graywolf
      --with-yosys
    ]

    # ENV["CFLAGS"] = "-Wno-error=implicit-function-declaration"
    
    system "./configure", *args
    system "make"
    system "make", "install"
    
  end

end
