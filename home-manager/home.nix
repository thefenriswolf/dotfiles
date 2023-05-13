{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "stefan";
  home.homeDirectory = "/home/ro";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # home manager settings
  programs.home-manager.enable = true;
  news.display = "silent";

  imports = [ ./nvim.nix ./git.nix ./emacs.nix ];

  # nix settings
  nixpkgs.config = { allowUnfree = true; };

  # user config starts here
  home.sessionVariables = {
    EDITOR = "nano";
    VISUAL = "nano";
    GIT_EDITOR = "nano";
    HOME_MANAGER_CONFIG = /home/ro/.config/home-manager/home.nix;
  };

  programs.btop.enable = true;

  home.packages = [
    # doom emacs helper packages
    pkgs.ripgrep
    pkgs.xclip
    pkgs.wl-clipboard
    pkgs.maim
    pkgs.gnuplot
    pkgs.fd
    pkgs.wordnet
    pkgs.xdotool
    pkgs.shfmt
    pkgs.shellcheck

    # programming 

    # rustlang
    pkgs.rust-analyzer
    pkgs.rustup

    # golang
    pkgs.go
    pkgs.gotools
    pkgs.go-tools

    # latex
    pkgs.texlab
    pkgs.gnumake
    pkgs.texlive.combined.scheme-full

    # c/cpp
    pkgs.clang
    pkgs.clang-tools

    # python
    pkgs.python3Full
    pkgs.python310Packages.numpy
    pkgs.python310Packages.scikit-learn
    pkgs.python310Packages.pydicom
    pkgs.python310Packages.opencv4
    pkgs.python310Packages.matplotlib
    pkgs.black
    pkgs.isort
    pkgs.python310Packages.python-lsp-server
    pkgs.python310Packages.pyflakes

    # webassembly/js
    pkgs.nodejs

    # zfs
    pkgs.sanoid
    pkgs.httm

    # cli tools
    pkgs.pandoc
    pkgs.diff-pdf
    pkgs.nixfmt
    pkgs.lorri
    pkgs.yt-dlp
  ];
}
