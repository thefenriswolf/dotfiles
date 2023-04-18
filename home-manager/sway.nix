{ config, lib, pkgs, ... }: {

  xsession.enable = true;

  # sway
  #programs.swaylock.enable = true;
  programs.swaylock.settings = { show-failed-attempts = true; };

  programs.rofi.enable = true;
  programs.rofi.cycle = true;
  programs.rofi.location = "center";
  programs.rofi.configPath = "$XDG_CONFIG_HOME/rofi/config.rasi";

  wayland.windowManager.sway.swaynag.enable = true;

  # services.mako.enable = true;
  # services.mako.anchor = "top-right";
  # defaultTimeout = 2000;
  # icons = true;
  # layer = "top";
  # sort = "-time";

  #programs.waybar.enable = true;
  programs.waybar.systemd.enable = true;
  programs.waybar.settings = [{
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      output = [ "XWAYLAND0" ];
    };
  }];

  #services.polybar.enable = true;
  #services.polybar.script = "polybar bar &";
  #services.polybar.settings = {
  #  "module/volume" = {
  #    type = "internal/pulseaudio";
  #    format.volume = " ";
  #    label.muted.text = "🔇";
  #    label.muted.foreground = "#666";
  #    ramp.volume = [ "🔈" "🔉" "🔊" ];
  #    click.right = "pavucontrol &";
  #  };
  #};

  services.swayidle.enable = true;
  services.swayidle.events = [
    {
      event = "before-sleep";
      command = "${pkgs.swaylock}/bin/swaylock";
    }
    {
      event = "lock";
      command = "lock";
    }
  ];

  wayland.windowManager.sway = {
    enable = true;
    systemdIntegration = true;
    xwayland = true;
    wrapperFeatures.gtk = true;
  };

  wayland.windowManager.sway.config.input = {
    "*" = {
      xkb_layout = "de";
      xkb_variant = "nodeadkeys";
      xkb_options = "caps:swapescape";
    };
  };

  wayland.windowManager.sway.config.seat = {
    "*" = { hide_cursor = "when-typing enable"; };
  };

  wayland.windowManager.sway.config.window.titlebar = true;
  wayland.windowManager.sway.config.terminal = "foot";

  wayland.windowManager.sway.config.down = "j";
  wayland.windowManager.sway.config.up = "k";
  wayland.windowManager.sway.config.left = "h";
  wayland.windowManager.sway.config.right = "l";

  wayland.windowManager.sway.config.menu = "rofi -show run";
  wayland.windowManager.sway.config.modifier = "Mod4";
  wayland.windowManager.sway.config.output = {
    XWAYLAND0 = {
      bg = "/usr/share/backgrounds/Focal-Fossa_WP_4096x2304_GREY.png";
    };
  };

  wayland.windowManager.sway.config.keybindings = {
    "$mod+l" = "exec swaylock -f -k";
    "$mod+Return" = "exec foot";
    "$mod+Print" = "exec grimshot";
    "$mod+d" = "exec $menu";
    "$mod+b" = "splith";
    "$mod+v" = "splitv";
    # "$mod+" = "exec ";
    # "$mod+" = "exec ";
    # "$mod+" = "exec ";
    # "$mod+" = "exec ";
    # "$mod+" = "exec ";
    # "$mod+" = "exec ";
    # "$mod+" = "exec ";
    # "$mod+" = "exec ";
  };
}
