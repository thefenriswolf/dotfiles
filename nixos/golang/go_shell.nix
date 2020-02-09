with import <nixpkgs> {};
mkShell {
  buildInputs = [
    go
    git
    emacs
  ];
}
