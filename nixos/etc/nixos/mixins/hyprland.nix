{ config, lib, pkgs, ... }:
let unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  # xwayland
  programs = {
    xwayland.enable = true;
    hyprland = {
      enable = false;
      xwayland.enable = false;
      # package = unstable.hyprland;
      package = pkgs.hyprland;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      systemd.setPath.enable = true;
    };
  };
}
