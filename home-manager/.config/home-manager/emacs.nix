{ config, lib, pkgs, ... }: {

  editorconfig.enable = true;

  xdg.configFile."doom/config.el".source =
    /home/ro/playground/dotfiles/doom/.config/doom/config.el;
  xdg.configFile."doom/init.el".source =
    /home/ro/playground/dotfiles/doom/.config/doom/init.el;
  xdg.configFile."doom/packages.el".source =
    /home/ro/playground/dotfiles/doom/.config/doom/packages.el;

  programs.emacs = {
    enable = true;
    # package = pkgs.emacs-nox;
    package = pkgs.emacs28-nox;
  };

  home.packages = [
    #    pkgs.emacs-nox
    pkgs.xclip
    pkgs.gnuplot
    pkgs.ditaa
    pkgs.plantuml
    pkgs.ripgrep
    pkgs.graphviz
    pkgs.fd
    pkgs.imagemagick
    pkgs.ffmpegthumbnailer
    pkgs.poppler
    pkgs.wordnet
    pkgs.xdotool
    pkgs.nodejs
    pkgs.shfmt
    pkgs.shellcheck
    pkgs.tldr

    pkgs.zeal
  ];
}
