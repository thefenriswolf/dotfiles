{ config, pkgs, ... }: {
  # Xorg
  services = {
    xserver = {
      excludePackages = with pkgs; [ xterm ];
      enable = true;
      layout = "at";
      xkbOptions = "eurosign:e";
      xkbVariant = "nodeadkeys";
      libinput.enable = true;
      desktopManager = { lxqt.enable = true; };
      displayManager = {
        defaultSession = "hyprland";
        sddm.enable = true;
        startx.enable = true;
      };
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
  documentation = {
    enable = true;
    nixos.enable = false;
    man.enable = true;
    info.enable = false;
    doc.enable = false;
  };

  services.gnome.gnome-keyring.enable = true;

  services.clamav = {
    updater.frequency = 1; # updates per day
    updater.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-kde ];
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  systemd.extraConfig = ''
    DefaultTimeoutStartSec=30s
    DefaultTimeoutStopSec=30s
  '';

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
    systemPackages = with pkgs; [
      xfce.xfburn
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
      swaylock
      ffmpeg
      imagemagick
      swayimg
      clamav
      mpv
      hyprland
      swww
      busybox
      xplorer
      libnotify
      libsForQt5.print-manager
      gwenview
      zathura
      xwayland
      wayland-protocols
      wayland-utils
      wl-clipboard
      wlroots
      xdg-desktop-portal-gtk
      xdg-desktop-portal-kde
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
