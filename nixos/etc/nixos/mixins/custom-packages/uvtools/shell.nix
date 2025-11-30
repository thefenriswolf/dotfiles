{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = [
    pkgs.nuget-to-json

    # keep this line if you use bash
    pkgs.bashInteractive
  ];
}
