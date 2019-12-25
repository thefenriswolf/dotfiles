with import <nixpkgs> {};
stdenv.mkDerivation rec {
  version = "0.1.0";
  name = "tensorman";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    ghc
    stack
    git
    emacs
  ];
}
