{ config, lib, pkgs, ... }: {
  home.packages =
    [ pkgs.texlive.combined.scheme-full pkgs.ghostscript pkgs.latexrun ];
}
