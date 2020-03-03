with import <nixpkgs> {};
mkShell {
  buildInputs = [
    clangStdenv
    llvmPackages.libcxxClang
    git
    lldb
    lld
    file
    emacs
    vim
    colormake
    ncurses
    glibc
  ];
}
