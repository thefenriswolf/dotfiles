{ config, lib, pkgs, ... }: {

  home.packages = [
    # shell
    pkgs.shfmt

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
    #pkgs.dotnet-sdk
    #pkgs.nuget-to-nix
    #pkgs.omnisharp-roslyn
    #pkgs.csharpier

    # java/jvm
    pkgs.clojure
    pkgs.clojure-lsp
    pkgs.leiningen
    pkgs.clj-kondo
    pkgs.cljfmt
    #pkgs.jdk
    pkgs.graalvm-ce
    #pkgs.babashka
    #pkgs.kotlin
    #pkgs.kotlin-native
    #pkgs.kotlin-language-server
    #pkgs.ktlint
    #pkgs.detekt

    # elixir
    # pkgs.elixir
    # pkgs.elixir-ls
    # pkgs.asdf-vm

    # erlang
    # pkgs.erlang
    # pkgs.erlang-ls

    # Odin
    #pkgs.odin
    #pkgs.ols

    # lua
    # pkgs.love
    # pkgs.lua
    pkgs.lua-language-server
    pkgs.stylua

    # scheme
    # pkgs.chicken
    # pkgs.gambit
    # pkgs.racket

    # nix
    # pkgs.niv
    pkgs.nixfmt-classic

    # rustlang
    # pkgs.rustup
    # pkgs.rustc
    # pkgs.rustfmt
    # pkgs.cargo
    # pkgs.clippy
    # pkgs.rust-analyzer

    # cross plattform TUI
    # pkgs.dosbox

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
    pkgs.govulncheck

    # c/cpp
    pkgs.clang
    # pkgs.gcc
    pkgs.clang-tools
    pkgs.gnumake

    # python
    pkgs.python3Full
    #pkgs.python311Packages.numpy
    #pkgs.python311Packages.scikit-image
    #pkgs.python311Packages.pydicom
    #pkgs.python311Packages.opencv4
    #pkgs.python311Packages.matplotlib
    pkgs.black
    pkgs.isort
    pkgs.python311Packages.python-lsp-server
    pkgs.python311Packages.pyflakes
    pkgs.python311Packages.pygments
    pkgs.python311Packages.virtualenv
    pkgs.python311Packages.pip
    #pkgs.python311Packages.pyyaml
    #pkgs.python311Packages.pip-requirements-parser

    # R
    #pkgs.rPackages.ISwR

    # Julia
    # pkgs.julia
  ];
}
