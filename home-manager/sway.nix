{ config, lib, pkgs, ... }: {

  # sway
  #programs.swaylock.enable = true;
  #programs.swaylock.settings = { show-failed-attempts = true; };

  # Rofi App launcher
  programs.rofi.enable = false;
  programs.rofi.location = "center";
  programs.rofi.cycle = true;
  programs.rofi.terminal = "$(which alacritty)";
  programs.rofi.theme = "arthur";
  #programs.rofi.configPath = "~/.config/rofi/config.rasi";
  programs.rofi.extraConfig = {
    midi = "drun, emoji, ssh";
    kb-primary-paste = "Control+V,Shift+Insert";
  };

  wayland.windowManager.sway.extraConfig =
    "\n    xwayland enable output\n    * bg # 000000 solid_color\n    ";

  #programs.waybar.settings = [{
  #  mainBar = {
  #    layer = "top";
  #    position = "top";
  #    height = 30;
  #    output = [ "XWAYLAND0" ];
  #  };
  #}];

  #  services.swayidle.events = [
  #   {
  #     event = "before-sleep";
  #     command = "${pkgs.swaylock}/bin/swaylock";
  #   }
  #   {
  #     event = "lock";
  #     command = "lock";
  #   }
  # ];
  #
  # wayland.windowManager.sway = {
  #   enable = true;
  #   systemdIntegration = true;
  #   xwayland = true; # ~xwayland enable~
  #   wrapperFeatures.gtk = true;
  # };
  #
  # wayland.windowManager.sway.config.input = {
  #   "*" = {
  #     xkb_layout = "de";
  #     xkb_variant = "nodeadkeys";
  #     xkb_options = "caps:swapescape";
  #   };
  # };
  #
  # wayland.windowManager.sway.config.seat = {
  #   "*" = { hide_cursor = "when-typing enable"; };
  # };
  #
  # wayland.windowManager.sway.config.window.titlebar = true;
  # wayland.windowManager.sway.config.terminal = "foot";
  #
  # wayland.windowManager.sway.config.down = "j";
  # wayland.windowManager.sway.config.up = "k";
  # wayland.windowManager.sway.config.left = "h";
  # wayland.windowManager.sway.config.right = "l";
  #
  # wayland.windowManager.sway.config.menu = "rofi -show run";
  # wayland.windowManager.sway.config.modifier = "Mod4";
  # wayland.windowManager.sway.config.output = {
  #   XWAYLAND0 = {
  #     bg = "/usr/share/backgrounds/Focal-Fossa_WP_4096x2304_GREY.png";
  #   };
  # };
  #
  # wayland.windowManager.sway.config.keybindings = {
  #   "$mod+l" = "exec swaylock -f -k";
  #   "$mod+Return" = "exec foot";
  #   "$mod+Print" = "exec grimshot";
  #   "$mod+d" = "exec $menu";
  #   "$mod+b" = "splith";
  #   "$mod+v" = "splitv";
  #   # "$mod+" = "exec ";
  #   # "$mod+" = "exec ";
  #   # "$mod+" = "exec ";
  #   # "$mod+" = "exec ";
  #   # "$mod+" = "exec ";
  #   # "$mod+" = "exec ";
  #   # "$mod+" = "exec ";
  #   # "$mod+" = "exec ";
  # };
}
