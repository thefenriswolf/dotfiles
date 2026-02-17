{
  config,
  pkgs,
  inputs,
  ...
}:
{

  programs.thunderbird = {
    enable = true;
  };
  programs.firefox = {
    enable = false;
    preferencesStatus = "user";
    languagePacks = [
      "de"
      "en-GB"
    ];
    preferences = {
      "browser.translations.neverTranslateLanguages" = "de";
      "browser.toolbars.bookmarks.visibility" = "always";
      "browser.ml.chat.enabled" = false;
      "services.sync.engine.history" = false;
      "services.sync.engine.passwords" = false;
      "browser.contextual-password-manager.enabled" = false;
      "services.sync.engine.prefs.modified" = false;
      "browser.urlbar.placeholderName" = "DuckDuckGo";
      "browser.urlbar.placeholderName.private" = "DuckDuckGo";
      "privacy.clearOnShutdown_v2.formdata" = true;
      "privacy.clearOnShutdown.offlineApps" = true;
      "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = true;
      "privacy.clearOnShutdown_v2.cookiesAndStorage" = true;
      "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = true;
      "browser.contentblocking.category" = "standard";
    };
  };

  services = {
    gnome = {
      core-apps.enable = true;
      sushi.enable = true; # nautilus preview
      games.enable = false;
      core-developer-tools.enable = false;
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
    desktopManager = {
      gnome = {
        enable = true;
      };
    };
    displayManager.gdm = {
      enable = true;
      wayland = true;
      autoSuspend = false;
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

  # Only install the docs I use
  documentation = {
    enable = false;
    nixos.enable = false;
    man.enable = false;
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

      gnome-firmware
      gnome-tweaks
      adwaita-icon-theme
      gnomeExtensions.dash-to-panel

      mpv
      losslesscut-bin
      yt-dlp
      hledger
      hledger-web
      hledger-ui
      hledger-fmt

      calibre
      mtpfs
      libmtp
      android-file-transfer
    ];
    sessionVariables = {
      # NIXOS_OZONE_WL = "1";
      # WLR_NO_HARDWARE_CURSORS = "1";
    };
    variables = {
      # XCURSOR_SIZE = "24";
      # XDG_CURRENT_DESKTOP = "Hyprland";
      # XDG_SESSION_TYPE = "wayland";
      # XDG_SESSION_DESKTOP = "Hyprland";
      # GDK_BACKEND = "wayland,x11";
      # QT_QPA_PLATFORM = "wayland;xcb";
      # QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      # QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      # OZONE_PLATFORM = "wayland";
      # SDL_VIDEODRIVER = "wayland";
      # ROC_ENABLE_PRE_VEGA = "1";
    };
  };
}
