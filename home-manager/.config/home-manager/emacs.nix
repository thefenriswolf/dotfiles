{ config, lib, pkgs, ... }: {

  editorconfig.enable = true;

  programs.emacs = {
    enable = true;
    # package = pkgs.emacs-nox;
    package = pkgs.emacs29-pgtk;
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
    pkgs.mediainfo
    pkgs.mpv
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
