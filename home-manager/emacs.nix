{ config, lib, pkgs, ... }: {
  programs.emacs = { enable = true; };
  programs.ripgrep.enable = true;
  editorconfig.enable = true;

  home.packages = [
    pkgs.xclip
    pkgs.gnuplot
    pkgs.fd
    pkgs.wordnet
    pkgs.xdotool
    pkgs.nodejs
    pkgs.shfmt
    pkgs.shellcheck
    pkgs.tldr
  ];
}
