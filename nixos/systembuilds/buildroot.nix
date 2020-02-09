with import <nixpkgs> {};
mkShell {
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
