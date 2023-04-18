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
  home.stateVersion = "22.11";

  # home manager settings
  programs.home-manager.enable = true;
  news.display = "silent";

  imports = [ ./nvim.nix ];

  # nix settings
  nixpkgs.config = { allowUnfree = true; };

  # user config starts here

  home.sessionVariables = {
    EDITOR = "nano";
    VISUAL = "nano";
    GIT_EDITOR = "nano";
    HOME_MANAGER_CONFIG = /home/ro/.config/home-manager/home.nix;
  };

  home.shellAliases = {
    sl = "ls -lisah";
    doom = "$HOME/.emacs.d/bin/doom";
    nv = "nvim";
  };

  programs.btop.enable = true;

  # emacs
  programs.emacs = { enable = true; };
  #  services.emacs = {
  #    enable = true;
  #    client.enable = true;
  #  };

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

    pkgs.rust-analyzer
    pkgs.rustup

    pkgs.go
    pkgs.gotools
    pkgs.tinygo

    pkgs.clang
    pkgs.clang-tools

    pkgs.python3Full
    pkgs.python310Packages.numpy
    pkgs.black
    pkgs.isort

    pkgs.deno
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

  programs.git = {
    enable = true;
    userEmail = "stefan.rohrbacher97@gmail.com";
    userName = "thefenriswolf";
  };
}
