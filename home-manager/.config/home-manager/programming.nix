{ config, lib, pkgs, ... }: {
  home.packages = [

    # zig
    pkgs.zig
    pkgs.zls

    # pascal
    #pkgs.fpc

    # c#/f#
    #pkgs.dotnet-sdk_8
    #pkgs.fantomas
    #pkgs.kotlin
    #pkgs.kotlin-native
    #pkgs.kotlin-language-server
    #pkgs.ktlint
    #pkgs.ktfmt
    #pkgs.detekt
    #pkgs.clang

    # elixir
    # pkgs.elixir
    # pkgs.elixir-ls
    # pkgs.asdf-vmi

    # Odin
    pkgs.odin

    # lua
    # pkgs.love
    # pkgs.lua
    # pkgs.lua-language-server
    # pkgs.stylua

    # scheme
    #pkgs.chicken
    #pkgs.gambit

    # nix
    #pkgs.niv
    pkgs.nixfmt

    # rustlang
    #pkgs.rustup

    # cross plattform TUI
    pkgs.dosbox

    # golang
    pkgs.go
    pkgs.gotools # godoc, ...
    pkgs.go-tools # staticcheck, ...
    pkgs.delve
    pkgs.gopls
    pkgs.revive
    pkgs.gomodifytags
    pkgs.gore
    pkgs.gotests
    pkgs.gocode
    pkgs.govulncheck

    # c/cpp
    #pkgs.clang
    #pkgs.clang-tools
    pkgs.gnumake

    # python
    pkgs.python3Full
    pkgs.python311Packages.numpy
    #pkgs.python311Packages.scikit-image
    pkgs.python311Packages.pydicom
    #pkgs.python311Packages.opencv4
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
