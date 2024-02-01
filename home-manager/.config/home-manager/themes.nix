{ config, lib, pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme = "gtk3";
    style.name = "adwaita-dark";
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "dracula";
      package = pkgs.dracula-icon-theme;
    };
    theme = {
      name = "catppuccin";
      package = pkgs.catppuccin-gtk;
    };
    cursorTheme = {
      name = "catppuccin cursors";
      package = pkgs.catppuccin-cursors;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables.GTK_THEME = "catppuccin";
}
