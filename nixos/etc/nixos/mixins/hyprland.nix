{
  config,
  lib,
  pkgs,
  ...
}:
{
  # xwayland
  programs = {
    xwayland.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
      # package = unstable.hyprland;
      package = pkgs.hyprland;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      systemd.setPath.enable = true;
    };
  };
}
