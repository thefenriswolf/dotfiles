{ config, lib, pkgs, ... }: {

  home.packages = [

    # zig
    pkgs.zig
    pkgs.zls

    # ocaml
    # pkgs.ocaml
    # pkgs.ocamlPackages.merlin
    # pkgs.ocamlPackages.utop
    # pkgs.ocamlPackages.ocp-indent
    # pkgs.ocamlPackages.stdune
    # pkgs.ocamlPackages.ocamlformat

    # pascal
    # pkgs.fpc

    # c#/f#
    # pkgs.dotnet-sdk_8
    # pkgs.mono
    # pkgs.omnisharp-roslyn
    # pkgs.csharpier
    # pkgs.fantomas

    # java/jvm
    # pkgs.clojure
    # pkgs.clojure-lsp
    # pkgs.leiningen
    # pkgs.clj-kondo
    # pkgs.cljfmt
    # pkgs.jdk
    # pkgs.kotlin
    # pkgs.kotlin-native
    # pkgs.kotlin-language-server
    # pkgs.ktlint
    # pkgs.ktfmt
    # pkgs.detekt

    # flutter
    # pkgs.flutter

    # elixir
    pkgs.elixir
    pkgs.elixir-ls
    pkgs.asdf-vm

    # Odin
    # pkgs.odin
    # pkgs.ols

    # lua
    # pkgs.love
    # pkgs.lua
    # pkgs.lua-language-server
    # pkgs.stylua

    # scheme
    # pkgs.chicken
    # pkgs.gambit

    # nix
    # pkgs.niv
    pkgs.nixfmt-classic

    # rustlang
    # pkgs.rustup
    pkgs.rustc
    pkgs.rustfmt
    pkgs.cargo
    pkgs.clippy
    pkgs.rust-analyzer

    # cross plattform TUI
    pkgs.dosbox

    # golang
    pkgs.go
    #    pkgs.tinygo
    pkgs.gotools # godoc, ...
    pkgs.go-tools # staticcheck, ...
    pkgs.delve
    pkgs.gopls
    pkgs.revive
    pkgs.gomodifytags
    pkgs.gore
    pkgs.gotests
    pkgs.govulncheck

    # c/cpp
    pkgs.clang
    # pkgs.gcc
    pkgs.clang-tools
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
