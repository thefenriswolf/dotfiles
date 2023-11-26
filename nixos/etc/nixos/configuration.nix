# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    <home-manager/nixos>
    ./mixins/bluetooth.nix
    ./mixins/printing.nix
    ./mixins/networking.nix
    ./mixins/sound.nix
    ./mixins/powersave.nix
    ./mixins/virt.nix
    ./mixins/desktop.nix
    ./mixins/nix.nix
    ./mixins/theming.nix
    ./mixins/ssh.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.systemd-boot.memtest86.enable = true;
  boot.loader.timeout = 5;

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8/UTF-8" "de_AT.UTF-8/UTF-8" ];
  };
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkbOptions in tty.
  };
  programs.thunar.enable = true;

  security.apparmor = {
    enable = true;
    packages = with pkgs; [ apparmor-utils apparmor-profiles ];
  };

  programs.direnv.enable = true;
  programs.dconf.enable = true;
  services.dbus.enable = true;
  services.dbus.packages = with pkgs; [ xfce.xfconf gnome2.GConf ];
  programs.light.enable = true;
  services.gvfs.enable = true;

  # login daemon
  services.greetd = {
    enable = true;
    vt = 1;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
      initial_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "ro";
      };
    };
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.ro = { pkgs, config, ... }: {
    home.stateVersion = "23.05";
    home.homeDirectory = "/home/ro";
    imports = [ "/home/ro/.config/home-manager/home.nix" ];
    home.packages = [ ];
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  users.users.ro = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "disk"
      "audio"
      "video"
      "networkmanager"
      "systemd-journal"
      "input"
      "docker"
      "lxd"
      "podman"
    ];
    packages = with pkgs; [
      firefox
      vivaldi
      vivaldi-ffmpeg-codecs
      widevine-cdm
      tree
      git
      stow
      languagetool
      gnumake
      brave
      home-manager
      neovim
      snapper
      xfce.thunar-archive-plugin
      xfce.thunar-volman
      xfce.thunar-media-tags-plugin
      zip
      unzip
      xz
      file
      gnutar

      alacritty
      wofi
      rofi
      waybar
      brightnessctl
      grim
      dunst
      libnotify
      wlsunset
      swaybg
      swayidle
      wl-clipboard

      greetd.tuigreet
    ];
  };

  services.flatpak.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}

