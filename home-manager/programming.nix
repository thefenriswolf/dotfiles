{ config, lib, pkgs, ... }: {
  home.packages = [
    # nix
    pkgs.nixfmt
    pkgs.lorri

    # rustlang
    pkgs.rustup

    # golang
    pkgs.go
    pkgs.gotools
    pkgs.go-tools

    # c/cpp
    #pkgs.clang
    #pkgs.clang-tools
    #pkgs.gnumake

    # python
    #pkgs.python3Full
    #pkgs.python311Packages.numpy
    #pkgs.python311Packages.scikit-learn
    #pkgs.python311Packages.pydicom
    #pkgs.python311Packages.opencv4
    #pkgs.python311Packages.matplotlib
    #pkgs.black
    #pkgs.isort
    #pkgs.python311Packages.python-lsp-server
    #pkgs.python311Packages.pyflakes
    #pkgs.python311Packages.pygments

    # R
    #pkgs.rPackages.ISwR

  ];
}
