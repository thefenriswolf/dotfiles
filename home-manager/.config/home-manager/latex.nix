{ config, lib, pkgs, ... }: {
  home.packages = [ pkgs.texliveFull pkgs.latexrun ];
}
