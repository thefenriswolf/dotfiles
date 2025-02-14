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

  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ libvdpau-va-gl ];
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  };

  programs.kdeconnect = {
    enable = false;
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
      kdePackages.kio-fuse
      kdePackages.kio-extras
      kdePackages.kmag
      kdePackages.qtsvg
      kdePackages.kate
      kdePackages.dolphin
      kdePackages.dolphin-plugins

      handbrake
      ffmpeg
      imagemagick

      calibre
      mtpfs

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
