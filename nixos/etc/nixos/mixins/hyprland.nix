{ config, lib, pkgs, ... }:
let unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  # xwayland
  programs = {
    xwayland.enable = true;
    hyprland = {
      xwayland.enable = true;
      enable = true;
      package = unstable.hyprland;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
  };
}
