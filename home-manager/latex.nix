{ config, lib, pkgs, ... }: {
  home.packages = [ pkgs.texlab pkgs.texlive.combined.scheme-full ];
}
