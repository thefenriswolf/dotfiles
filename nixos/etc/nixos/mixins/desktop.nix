{ config, pkgs, ... }: {
  # Xorg
  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
    layout = "at";
    xkbOptions = "eurosign:e";
    xkbVariant = "nodeadkeys";
    libinput.enable = true;
  };
  # xwayland
  programs.xwayland.enable = true;
  programs.hyprland.xwayland.enable = true;

  # hyprland
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.variables.GTK_THEME = "Catppuccin-Macchiato-Standard-Teal-Dark";
  environment.variables.XCURSOR_THEME = "Catppuccin-Macchiato-Teal";
  environment.variables.XCURSOR_SIZE = "24";
  environment.variables.XDG_CURRENT_DESKTOP = "Hyprland";
  environment.variables.XDG_SESSION_TYPE = "wayland";
  environment.variables.XDG_SESSION_DESKTOP = "Hyprland";
  environment.variables.GDK_BACKEND = "wayland,x11";
  environment.variables.QT_QPA_PLATFORM = "wayland;xcb";
  environment.variables.QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  environment.variables.QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  environment.variables.OZONE_PLATFORM = "wayland";
  environment.variables.SDL_VIDEODRIVER = "wayland";
}
