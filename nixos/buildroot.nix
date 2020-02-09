with import <nixpkgs> {};
stdenv.mkDerivation rec {
  version = "0.1.0";
  name = "buildroot";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    curl
    git
    sed
    unzip
    patch
    rsync
    wget
    binutils
    perl
    tar
    cpio
    bc
    gzip
    bzip2
    make
    clang
    llvm
    glibc
    pkgconfig
  ];
}
