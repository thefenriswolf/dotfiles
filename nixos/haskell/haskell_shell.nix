with import <nixpkgs> {};
mkShell {
  buildInputs = [
    ghc
    stack
    hlint
    git
    emacs
  ];
}
