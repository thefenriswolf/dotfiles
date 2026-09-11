{
  config,
  pkgs,
  inputs,
  ...
}:
{

  programs.firefox = {
    enable = true;
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
      gnome-online-accounts.enable = true;
      games.enable = false;
      core-developer-tools.enable = false;
      gnome-remote-desktop.enable = false;
      gnome-browser-connector.enable = false;
      rygel.enable = false;
    };
    desktopManager = {
      gnome = {
        enable = true;
      };
    };

    libinput.enable = true;

    desktopManager = {
      plasma6.enable = false;
      plasma6.enableQt5Integration = false;
    };

    displayManager = {
      gdm.enable = true;
      plasma-login-manager.enable = false;
      autoLogin.enable = false;
      # defaultSession = "plasma";
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
    enable = true;
    nixos.enable = true;
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

      onlyoffice-desktopeditors
      libreoffice

      gnome-firmware
      gnome-tweaks
      gnomeExtensions.dash-to-panel
      gnomeExtensions.night-theme-switcher
      gnome-randr

      # KDE Utilities
      # xdg-desktop-portal
      # kdePackages.xdg-desktop-portal-kde
      # kdePackages.discover # Optional: Software center for Flatpak/firmware updates
      # kdePackages.kcalc # Calculator
      # kdePackages.kclock # Clock app
      # kdePackages.ksystemlog # System log viewer

      # Hardware/System Utilities (Optional)
      # kdePackages.isoimagewriter # Write hybrid ISOs to USB
      # kdePackages.partitionmanager # Disk and partition management
      # hardinfo2 # System benchmarks and hardware info
      # wayland-utils # Wayland diagnostic tools
      # wl-clipboard # Wayland copy/paste support

      adwaita-icon-theme
      dracula-icon-theme
      phinger-cursors
      wlr-which-key

      mpv
      yt-dlp
      hledger
      hledger-fmt
      hledger-utils

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
