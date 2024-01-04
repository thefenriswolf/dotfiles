{ config, lib, pkgs, ... }: {
  home.packages = [

    # zig
    pkgs.zig
    pkgs.zls

    # pascal
    #pkgs.fpc

    # lua
    #pkgs.love

    # scheme
    pkgs.chicken
    pkgs.gambit

    # nix
    pkgs.nixfmt

    # rustlang
    #pkgs.rustup

    # golang
    pkgs.go
    pkgs.gotools # godoc, ...
    pkgs.go-tools # staticcheck, ...
    pkgs.delve
    pkgs.gopls
    pkgs.gomodifytags
    pkgs.gore
    pkgs.gotests
    pkgs.gocode

    # c/cpp
    #pkgs.clang
    #pkgs.clang-tools
    pkgs.gnumake

    # python
    pkgs.python3Full
    pkgs.python311Packages.numpy
    pkgs.python311Packages.scikit-image
    pkgs.python311Packages.pydicom
    pkgs.python311Packages.opencv4
    pkgs.python311Packages.matplotlib
    pkgs.black
    pkgs.isort
    pkgs.nodePackages.pyright
    pkgs.python311Packages.python-lsp-server
    pkgs.python311Packages.pyflakes
    pkgs.python311Packages.pygments
    pkgs.python311Packages.virtualenv
    pkgs.python311Packages.pip
    pkgs.python311Packages.pyyaml
    pkgs.python311Packages.pip-requirements-parser

    # R
    #pkgs.rPackages.ISwR
  ];
}
