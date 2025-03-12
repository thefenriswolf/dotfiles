# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration_sd_zfs.nix
    <home-manager/nixos>
    ./mixins/bluetooth.nix
    ./mixins/printing.nix
    ./mixins/networking.nix
    ./mixins/sound.nix
    ./mixins/powersave.nix
    ./mixins/virt.nix
    ./mixins/desktop.nix
    #./mixins/hyprland.nix
    ./mixins/nix.nix
    ./mixins/theming.nix
    ./mixins/ssh.nix
    ./mixins/gaming.nix
    #./mixins/filesystem_btrfs.nix
    ./mixins/filesystem_zfs.nix
    ./mixins/security.nix
    ./mixins/dev.nix
    ./mixins/sync.nix
    ./mixins/cli.nix
    ./mixins/host-laptop.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 5;
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
        memtest86.enable = true;
      };
    };
  };

  services.lvm.enable = false;
  boot.initrd.services.lvm.enable = false;

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8/UTF-8" "de_AT.UTF-8/UTF-8" ];
    extraLocaleSettings = {
      LANGUAGE = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
      LC_CTYPE = "en_US.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_COLLATE = "en_US.UTF-8";
      LC_TIME = "de_DE.UTF-8";
      LC_MESSAGES = "en_US.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LANG = "en_US.UTF-8";
    };
  };
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  programs.direnv.enable = true;
  programs.dconf.enable = true;
  services.dbus.enable = true;
  services.dbus.packages = with pkgs; [ gnome2.GConf ];
  programs.light.enable = true;
  services.gvfs.enable = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.ro = { pkgs, config, ... }: {
    home.stateVersion = "23.11";
    home.homeDirectory = "/home/ro";
    imports = [ "/home/ro/.config/home-manager/home.nix" ];
    home.packages = [ ];
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  programs = {
    gnome-disks.enable = true;
    seahorse.enable = false;
  };

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
      "docker"
      "gamemode"
      "cups"
      "syncthing"
    ];
    packages = with pkgs; [
      widevine-cdm
      firefox
      tree
      git
      google-drive-ocamlfuse
      stow
      aria2
      wget
      curl

      # 3D Slicer
      itk
      vtkWithQt5
      xorg.libXinerama
      libGLU
      libnsl
      xorg.libxcb

      languagetool
      gnumake
      home-manager
      fuzzel
      zip
      unzip
      xz
      bzip2
      gzip
      rar
      p7zip
      fwupd
      openvpn
      gnome-firmware

      gparted
      rsync

      file
      gnutar

      wofi
      rofi
      waybar
      brightnessctl
      grim
      # dunst
      libnotify
      wlsunset
      swaybg
      swayidle
      pdfgrep
      wl-clipboard
    ];
  };

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}

