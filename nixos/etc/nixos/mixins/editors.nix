{ config, lib, pkgs, inputs, ... }:

let lover = import ./custom-packages/lover.nix { inherit pkgs; };

in {
  environment.systemPackages = with pkgs; [
    tree-sitter
    stylua
    luaformatter
    lua
    lua52Packages.lua-lsp
    lua-language-server
    ltex-ls
    fd

    # shell
    shfmt

    # ocaml
    # pkgs.ocaml
    # pkgs.ocamlPackages.merlin
    # pkgs.ocamlPackages.utop
    # pkgs.ocamlPackages.ocp-indent
    # pkgs.ocamlPackages.stdune
    # pkgs.ocamlPackages.ocamlformat

    # pascal
    # pkgs.fpc

    # js
    #assemblyscript
    #typescript
    typescript-language-server
    #electron-bin
    #nodePackages.prettier
    #nodejs
    #node2nix

    # c#/f#
    #pkgs.dotnet-sdk
    #pkgs.nuget-to-nix
    #pkgs.omnisharp-roslyn
    #pkgs.csharpier

    # java/jvm
    #pkgs.clojure
    #pkgs.clojure-lsp
    #pkgs.leiningen
    #pkgs.clj-kondo
    #pkgs.cljfmt
    #pkgs.jdk
    #pkgs.graalvm-ce
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
    love
    lover

    # scheme
    # pkgs.chicken
    # pkgs.gambit
    # pkgs.racket

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
    go
    gotools # godoc, ...
    go-tools # staticcheck, ...
    delve
    gopls
    revive
    gomodifytags
    gore
    gotests
    govulncheck

    # c/cpp
    clang
    # pkgs.gcc
    clang-tools
    gnumake

    # python
    python3Full
    #pkgs.python311Packages.numpy
    #pkgs.python311Packages.scikit-image
    #pkgs.python311Packages.pydicom
    #pkgs.python311Packages.opencv4
    #pkgs.python311Packages.matplotlib
    black
    isort
    python311Packages.python-lsp-server
    python311Packages.pyflakes
    python311Packages.pygments
    python311Packages.virtualenv
    python311Packages.pip
    #pkgs.python311Packages.pyyaml
    #pkgs.python311Packages.pip-requirements-parser

    # R
    #pkgs.rPackages.ISwR

    # Julia
    # pkgs.julia
  ];

  nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ];

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
  };

  services.emacs = { enable = true; };

}

