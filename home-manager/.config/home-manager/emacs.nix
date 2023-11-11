{ config, lib, pkgs, ... }: {
  programs.ripgrep.enable = true;
  editorconfig.enable = true;

  home.packages = [
    pkgs.xclip
    pkgs.gnuplot
    pkgs.ditaa
    pkgs.plantuml
    pkgs.graphviz
    pkgs.fd
    pkgs.imagemagick
    pkgs.ffmpegthumbnailer
    pkgs.mediainfo
    pkgs.poppler
    pkgs.emacs29-nox
    pkgs.wordnet
    pkgs.xdotool
    pkgs.nodejs
    pkgs.shfmt
    pkgs.shellcheck
    pkgs.tldr
  ];
}
