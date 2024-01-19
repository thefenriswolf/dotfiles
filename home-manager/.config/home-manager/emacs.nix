{ config, lib, pkgs, ... }: {
  editorconfig.enable = true;
  home.packages = [
    pkgs.emacs-nox
    pkgs.xclip
    pkgs.gnuplot
    pkgs.ditaa
    pkgs.plantuml
    pkgs.ripgrep
    pkgs.graphviz
    pkgs.fd
    pkgs.fzf
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
  ];
}
