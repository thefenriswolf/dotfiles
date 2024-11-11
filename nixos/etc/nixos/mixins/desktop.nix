{ config, pkgs, ... }: {

  # auto-enable appimage-run
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  services = {
    libinput.enable = true;
    desktopManager = {
      plasma6.enable = true;
      plasma6.enableQt5Integration = true;
    };
    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        wayland.enable = true;
        autoNumlock = true;
        enableHidpi = true;
      };
    };

    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      desktopManager = { plasma5.enable = false; };
      xkb = {
        layout = "at";
        options = "eurosign:e";
        variant = "nodeadkeys";
      };
    };
  };

  # hardware.opengl = {
  #   driSupport = true;
  #   driSupport32Bit = true;
  #   extraPackages = with pkgs; [ rocmPackages.clr.icd ];
  # };

  programs.kdeconnect.enable = true;

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
    wlr.enable = false;
    extraPortals = [ pkgs.xdg-desktop-portal-kde ];
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  systemd.extraConfig = ''
    DefaultTimeoutStartSec=30s
    DefaultTimeoutStopSec=30s
  '';

  services.zeitgeist.enable = true;

  # envvars
  environment = {
    systemPackages = with pkgs; [
      xfce.xfburn
      hunspell
      hunspellDicts.en_US
      hunspellDicts.de_AT
      hunspellDicts.de_DE
      hunspellDicts.en_GB-large
      xfce.thunar-archive-plugin
      xfce.thunar
      kile
      inkscape-with-extensions
      joplin-desktop

      kdePackages.skanlite
      kdePackages.ark
      kdePackages.okular
      kdePackages.discover
      kdePackages.spectacle
      kdePackages.networkmanager-qt
      kdePackages.kcalc
      kdePackages.kio
      kdePackages.kmag
      kdePackages.kigo
      kdePackages.kate
      kdePackages.kmail
      kdePackages.kalarm
      kdePackages.tokodon
      kdePackages.kbackup
      kdePackages.dolphin
      kdePackages.dolphin-plugins
      kdePackages.kteatime

      handbrake
      swaylock
      ffmpeg
      imagemagick
      ghostscript
      swayimg
      clamav
      hyprland
      swww
      appimage-run
      coreutils-full
      libnotify
      libsForQt5.print-manager
      gwenview
      xwayland
      wayland-protocols
      wayland-utils
      wl-clipboard
      wlroots
      xdg-desktop-portal-kde
    ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
    variables = {
      # XCURSOR_SIZE = "24";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      GDK_BACKEND = "wayland,x11";
      QT_QPA_PLATFORM = "wayland;xcb";
      #  QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      #  QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      OZONE_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      ROC_ENABLE_PRE_VEGA = "1";
    };
  };
}
