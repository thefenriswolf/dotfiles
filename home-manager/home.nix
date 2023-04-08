{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "stefan";
  home.homeDirectory = "/home/stefan";

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
  news.display = "show";

  # nix settings
  nixpkgs.config = { allowUnfree = true; };

  # user config starts here

  home.sessionVariables = {
    EDITOR = "nano";
    VISUAL = "nano";
    GIT_EDITOR = "nano";
    HOME_MANAGER_CONFIG = ~/.config/home-manager/home.nix;
  };

  home.shellAliases = {
    sl = "ls -lisah";
    doom = "/home/stefan/.emacs.d/bin/doom";
  };

  programs.btop.enable = true;

  programs.emacs = { enable = true; };

  programs.zsh = {
    enable = true;
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;
    enableVteIntegration = true;
    history.size = 10000;
    history.ignoreSpace = true;
    history.ignoreDups = true;
    history.extended = true;
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "robbyrussell";
    shellAliases = {
      sl = "ls -lisah";
      doom = "/home/stefan/.emacs.d/bin/doom";
      emacs = "emacs -nw";
      ".." = "cd ..";
    };
  };

  home.packages = [
    # doom emacs helper packages
    pkgs.ripgrep
    pkgs.nodejs
    pkgs.xclip
    pkgs.wl-clipboard
    pkgs.maim
    pkgs.xdotool
    pkgs.shfmt
    pkgs.shellcheck
    pkgs.rust-analyzer

    # programming
    pkgs.rustup
    pkgs.racket

    # snap
    pkgs.sanoid
    pkgs.httm
    
    pkgs.pandoc
    pkgs.diff-pdf
    pkgs.nixfmt
    pkgs.lorri
    pkgs.direnv
    pkgs.yt-dlp
  ];

  programs.git = {
    enable = true;
    # userName = "Stefan Rohrbacher";
    userEmail = "stefan.rohrbacher97@gmail.com";
    userName = "thefenriswolf";
  };

}
