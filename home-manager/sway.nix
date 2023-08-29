{ config, lib, pkgs, ... }: {
  programs.zellij.enable = true;
  home.packages = [ pkgs.ioztat ];
}
