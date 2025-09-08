{ config, pkgs, inputs, ... }: {

  programs.thunderbird = { enable = false; };

  services = {
    gnome = {
      games.enable = false;
      core-apps.enable = true;
      sushi.enable = true;
      gnome-online-accounts.enable = false;
      gnome-remote-desktop.enable = false;
      gnome-browser-connector.enable = false;
      rygel.enable = false;
    };
    libinput.enable = true;
    desktopManager = {
      plasma6.enable = false;
      plasma6.enableQt5Integration = false;
    };

    displayManager = {
      autoLogin.enable = false;
      #defaultSession = "plasma";
      sddm = {
        enable = false;
        wayland.enable = true;
        autoNumlock = true;
        enableHidpi = true;
      };
    };
    xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
        autoSuspend = false;
      };
      desktopManager = { gnome = { enable = true; }; };
      videoDrivers = [ "amdgpu" ];
      xkb = {
        layout = "at";
        options = "eurosign:e";
        variant = "nodeadkeys";
      };
    };
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

  environment = {
    systemPackages = with pkgs; [
      hunspell
      hunspellDicts.en_US
      hunspellDicts.de_AT
      hunspellDicts.de_DE
      hunspellDicts.en_GB-large
      inkscape-with-extensions

      #kdePackages.skanlite
      #kdePackages.ark
      #kdePackages.okular
      #kdePackages.spectacle
      #kdePackages.networkmanager-qt
      #kdePackages.kcalc
      #kdePackages.kio
      #kdePackages.kio-fuse
      #kdePackages.kio-extras
      #kdePackages.kmag
      #kdePackages.qtsvg
      #kdePackages.kate
      #kdePackages.dolphin
      #kdePackages.dolphin-plugins

      gnome-firmware
      gnome-tweaks
      adwaita-icon-theme
      numix-cursor-theme
      numix-icon-theme
      gnomeExtensions.dash-to-panel
      gparted

      handbrake
      mpv
      yt-dlp

      inputs.tiddlydesktop.packages.x86_64-linux.tiddlydesktop

      calibre
      mtpfs
      libmtp
      android-file-transfer
    ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
    variables = {
      #      XCURSOR_SIZE = "24";
      #      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      #      XDG_SESSION_DESKTOP = "Hyprland";
      #      GDK_BACKEND = "wayland,x11";
      #      QT_QPA_PLATFORM = "wayland;xcb";
      #  QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      #  QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      OZONE_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      # ROC_ENABLE_PRE_VEGA = "1";
    };
  };
}
