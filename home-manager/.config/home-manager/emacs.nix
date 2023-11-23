{ config, lib, pkgs, ... }: {
  # programs.ripgrep.enable = true;
  editorconfig.enable = true;

  programs.emacs.enable = true;
  services.emacs.package = pkgs.emacs-nox;
  services.emacs.enable = true;
  services.emacs.startWithUserSession = true;

  home.packages = [
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
