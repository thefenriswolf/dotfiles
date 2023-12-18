{ config, pkgs, ... }:

let greetFlags = "--remember --time --remember-session --user-menu --asterisks";
in {
  # login daemon
  services.greetd = {
    enable = true;
    vt = 1;
    settings = {
      default_session = {
        command =
          "${pkgs.greetd.tuigreet}/bin/tuigreet ${greetFlags} --cmd Hyprland";
        user = "ro";
      };
      #      initial_session = {
      #        command =
      #          "${pkgs.greetd.tuigreet}/bin/tuigreet ${greetFlags} --cmd startxfce4";
      #        user = "ro";
      #      };
    };
  };
  # Xorg
  services = {
    xserver = {
      excludePackages = with pkgs; [ xterm ];
      enable = true;
      layout = "at";
      xkbOptions = "eurosign:e";
      xkbVariant = "nodeadkeys";
      libinput.enable = true;
      desktopManager = { xfce.enable = true; };
      displayManager.startx.enable = true;
    };
  };
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-volman
    ];
  };

  # Only install the docs I use
  documentation.enable = true;
  documentation.nixos.enable = false;
  documentation.man.enable = true;
  documentation.info.enable = false;
  documentation.doc.enable = false;

  services.gnome.gnome-keyring.enable = true;

  xdg.portal.wlr.enable = true;

  xdg.portal.extraPortals =
    [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-kde ];
  security.polkit.enable = true;

  # systemd = {
  #   user = {
  #     services.emacsdaemon = {
  #       description = "Emacs daemon";
  #       wantedBy = [ "default.target" ];
  #       serviceConfig = {
  #         Type = "forking";
  #         ExecStart = "${pkgs.emacs} --daemon";
  #         ExecStop = "${pkgs.emacs}/bin/emacsclient -e '(kill-emacs)'";
  #         Restart = "on-failure";
  #       };
  #     };
  #   };
  # };

  # xwayland
  programs = {
    xwayland.enable = true;
    hyprland = {
      xwayland.enable = true;
      enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
  };

  # envvars
  environment = {
    xfce.excludePackages = with pkgs; [
      xfce.xfce4-terminal
      xfce.parole
      xfce.orage
      xfce.ristretto
    ];
    systemPackages = with pkgs; [
      xfce.xfburn
      xfce.xfce4-appfinder
      xfce.xfce4-clipman-plugin
      xfce.xfce4-cpugraph-plugin
      xfce.xfce4-dict
      xfce.xfce4-fsguard-plugin
      xfce.xfce4-genmon-plugin
      xfce.xfce4-netload-plugin
      xfce.xfce4-panel
      xfce.xfce4-pulseaudio-plugin
      xfce.xfce4-systemload-plugin
      xfce.xfce4-whiskermenu-plugin
      xfce.xfce4-xkb-plugin
      xfce.xfce4-settings
      xfce.xfdashboard
      xorg.xev
      hunspell
      hunspellDicts.en_US
      hunspellDicts.de_AT
      hunspellDicts.de_DE
      hunspellDicts.en_GB-large
      catppuccin
      catppuccin-gtk
      catppuccin-kde
      catppuccin-cursors
      vlc
      libsForQt5.ark
      handbrake
      ffmpeg
      imagemagick
      swayimg
      mpv
    ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
    variables = {
      GTK_THEME = "Catppuccin-Macchiato-Standard-Teal-Dark";
      XCURSOR_THEME = "Catppuccin-Macchiato-Teal";
      XCURSOR_SIZE = "24";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      GDK_BACKEND = "wayland,x11";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      OZONE_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
    };
  };
}
