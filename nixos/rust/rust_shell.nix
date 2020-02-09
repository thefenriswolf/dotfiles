with import <nixpkgs> {};
mkShell {
  buildInputs = [
    openssl
    rustc
    git
    cargo
    emacs
    glibc
    pkgconfig
  ];
}
