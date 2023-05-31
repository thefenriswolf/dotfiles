{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ro";
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
  nixpkgs.config = { 
    allowUnfree = true;
    experimental-features = "nix-command flakes";
  };

  # user config starts here
  home.sessionVariables = {
    EDITOR = "nano";
    VISUAL = "nano";
    GIT_EDITOR = "nano";
    HOME_MANAGER_CONFIG = /home/ro/.config/home-manager/home.nix;
  };

  programs.btop.enable = true;
  programs.ripgrep.enable = true;
  editorconfig.enable = true;
  programs.yt-dlp.enable = true;

  home.packages = [
    # doom emacs helper packages
    pkgs.xclip
    pkgs.gnuplot
    pkgs.fd
    pkgs.wordnet
    pkgs.xdotool
    pkgs.nodejs
    pkgs.shfmt
    pkgs.shellcheck
    pkgs.tldr
    pkgs.texlab
    pkgs.texlive.combined.scheme-full

    # programming

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

    # zfs
    pkgs.sanoid
    pkgs.httm
    pkgs.ioztat

    # cli tools
    pkgs.pandoc
    pkgs.diff-pdf
    pkgs.nixfmt
    pkgs.lorri
  ];
}
