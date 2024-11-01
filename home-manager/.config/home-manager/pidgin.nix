{ config, lib, pkgs, ... }: {

  home.packages = with pkgs.pidginPackages; [
    purple-slack
    purple-matrix
    purple-signald
    purple-discord
    purple-plugin-pack
  ];

}
