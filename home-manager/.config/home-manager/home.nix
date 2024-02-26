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
  home.stateVersion = "23.11";

  # home manager settings
  programs.home-manager.enable = true;
  news.display = "silent";

  imports = [
    ./cli.nix
    ./themes.nix
    ./programming.nix
    ./hypr.nix
    ./benchmark.nix
    ./git.nix
    ./emacs.nix
    ./nvim.nix
    ./zsh.nix
    ./latex.nix
    ./fonts.nix
    ./alien.nix
  ];

  # nix settings
  #  nixpkgs.config = {
  #    allowUnfree = true;
  #    experimental-features = "nix-command flakes";
  #  };

  #  nix = {
  #    package = pkgs.nix;
  #    settings.experimental-features = [ "nix-command" "flakes" ];
  #  };

  # enable gui integration on non-nixos
  # targets.genericLinux.enable = true;
  xdg.mime.enable = true;

  # user config starts here
  home.sessionVariables = {
    EDITOR = "nano";
    VISUAL = "nano";
    GIT_EDITOR = "nano";
    HOME_MANAGER_CONFIG = /home/ro/.config/home-manager/home.nix;
  };

  home.packages = [ pkgs.cowsay ];
}
