let
  pkgs = import <nixpkgs> {
    localSystem = {
      gcc.arch = "native";
      gcc.tune = "generic";
      system = "x86_64-linux";
    };
  };
in
pkgs.linuxPackages_6_12
