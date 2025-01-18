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
      defaultSession = "plasma";
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
      xkb = {
        layout = "at";
        options = "eurosign:e";
        variant = "nodeadkeys";
      };
    };
  };

  hardware.graphics = {
    enable32Bit = true;
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  };

  programs.kdeconnect = {
    enable = true;
    #package = pkgs.kdePackages.kdeconnect-kde;
  };

  programs.thunar = {
    enable = false;
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
    daemon.enable = false;
    updater.enable = false;
    updater.frequency = 1; # updates per day
  };

  xdg.portal = {
    enable = true;
    wlr.enable = false;
    # extraPortals = [ pkgs.xdg-desktop-portal-kde ];
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  systemd.extraConfig = ''
    DefaultTimeoutStartSec=30s
    DefaultTimeoutStopSec=30s
  '';

  services.zeitgeist.enable = false;

  # envvars
  environment = {
    systemPackages = with pkgs; [
      hunspell
      hunspellDicts.en_US
      hunspellDicts.de_AT
      hunspellDicts.de_DE
      hunspellDicts.en_GB-large
      inkscape-with-extensions

      kdePackages.skanlite
      kdePackages.ark
      kdePackages.okular
      kdePackages.spectacle
      kdePackages.networkmanager-qt
      kdePackages.kcalc
      kdePackages.kio
      kdePackages.kmag
      kdePackages.kate
      kdePackages.kalarm
      kdePackages.dolphin
      kdePackages.dolphin-plugins

      handbrake
      ffmpeg
      imagemagick
      ghostscript
      clamav
      swww
      appimage-run
      coreutils-full
      libnotify
      wl-clipboard
    ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
    variables = {
      # # XCURSOR_SIZE = "24";
      # XDG_CURRENT_DESKTOP = "Hyprland";
      # XDG_SESSION_TYPE = "wayland";
      # XDG_SESSION_DESKTOP = "Hyprland";
      GDK_BACKEND = "wayland,x11";
      QT_QPA_PLATFORM = "wayland;xcb";
      #  QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      #  QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      OZONE_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      # ROC_ENABLE_PRE_VEGA = "1";
    };
  };
}
