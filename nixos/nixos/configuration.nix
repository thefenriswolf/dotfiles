# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  #+ grub
  #boot.loader.grub = {
  #  enable = true;
  #  version = 2;
  #  copyKernels = true;
  #  configurationLimit = 20;
  #  zfsSupport = true;
  #  devices = [ "/dev/sdc" ];
  #};

  #+ systemd-boot
  boot = {
    zfs.enableUnstable = true;

    kernelParams = [
      "elevator=none"
      #"intel_iommu=on"
      "amd_iommu=pt"
      #"pci=nommconf"
      "pci=noaer"
      "ivrs_ioapic[32]=00:14.0"
    ];

    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 20;
      efi.canTouchEfiVariables = true;
    };
    hardwareScan = true;
    cleanTmpDir = true;
    supportedFilesystems = [ "zfs" "xfs" "ext4" ];
  };

  networking.hostName = "nixos-thinkpad";
  networking.hostId = "0011fd30";

  networking.networkmanager = { enable = true; };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global use DHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true;
  networking.interfaces.wlp0s29u1u1.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  #+ Select internationalisation properties.
  i18n = { defaultLocale = "de_AT.UTF-8"; };
  console.font = "Lat2-Terminus16";
  console.keyMap = "de";

  #+ Set your time zone.
  time.timeZone = "Europe/Vienna";

  #+ env variables
  environment = {
    # variables = { EDITOR = "emacs -nw"; };

    # List packages installed in system profile.
    systemPackages = with pkgs; [

      # dl
      wget
      zsync
      aria2
      youtube-dl
      kdeApplications.kio-extras
      ffsend
      rclone
      tarsnap
      rsync
      git
      gitAndTools.gh
      curl
      android-file-transfer

      # dev
      go
      tinygo
      nixfmt
      hlint
      kate

      # reverse engineering
      radare2-cutter
      ghidra-bin
      hexdump

      # office
      pandoc
      unoconv
      ark
      kdeApplications.dolphin-plugins
      plasma-integration
      kdeApplications.spectacle
      calibre
      libreoffice
      skanlite
      thunderbird
      openconnect

      # base cli
      coreutils
      pciutils
      man
      file
      traceroute
      ranger
      bash-completion
      nix-bash-completions
      direnv
      nano
      tree
      parted
      htop
      tmux
      networkmanager

      # multimedia
      cmus
      mpv
      pavucontrol
      pulseeffects
      vlc
      audacity
      gwenview
      okular
      irssi
      firefox
      brave

      # virt
      qemu
      virglrenderer
      virt-manager
      sanoid

      # debug
      strace
      tcpdump
      bpftool

      # utility
      solaar
      piper
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };

  #+ List services that you want to enable:

  #+ Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    hostKeys = [{
      bits = 4096;
      path = "/etc/ssh/host_ssh_key";
      type = "rsa";
    }];
  };

  #+ bpf kernel vm
  programs.bcc.enable = true;

  #+ lvfs firmware updater
  services.fwupd.enable = true;

  #+ zfs
  services.zfs.autoScrub = {
    enable = true;
    interval = "weekly";
    pools = [ "rpool" ];
  };
  services.zfs.trim = {
    enable = true;
    interval = "weekly";
  };

  #+ sanoid zfs snapshots
  services.sanoid = {
    enable = true;
    extraArgs = [ "--verbose" ];
    interval = "hourly";
  };

  #services.sanoid.datasets = {
  #  "home" = {
  #    "dataset" = rpool/home;
  #  };
  #};

  services.sanoid.templates = {
    "custom" = {
      "daily" = 31;
      "hourly" = 24;
      "monthly" = 4;
      "yearly" = 12;
      "autosnap" = true;
      "autoprune" = true;
    };
    "ignore" = {
      #"monitor" = true;
      "autosnap" = false;
      "autoprune" = false;
    };
  };

  services.sanoid.settings = {
    "home" = {
      "use_template" = "custom";
      "dataset" = "rpool/home";
    };
    "root" = {
      "use_template" = "custom";
      "dataset" = "rpool/root/nixos";
    };
    "dev" = {
      "use_template" = "custom";
      "dataset" = "rpool/home/dev";
    };
    "netdata" = {
      "use_template" = "custom";
      "dataset" = "rpool/netdata";
    };
    "pool" = {
      "use_template" = "custom";
      "dataset" = "rpool";
    };
    "nix" = {
      "use_template" = "ignore";
      "dataset" = "rpool/nix";
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall = { enable = true; };

  #+ Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.gutenprint pkgs.hplip ];
  };

  #+ Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  #+ Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "at";
    xkbVariant = "nodeadkeys";
    xkbOptions = "eurosign:e";
    videoDrivers = [ "amdgpu" ];
  };

  #+ opengl
  hardware = {
    u2f.enable = true;
    bluetooth.enable = true;
    bluetooth.package = pkgs.bluezFull;
    bluetooth.powerOnBoot = true;
    opengl.enable = true;
    opengl.driSupport32Bit = true;
    opengl.driSupport = true;
  };

  powerManagement.powertop.enable = true;
  powerManagement.cpuFreqGovernor = "powersave";

  #+ Enable touchpad support.
  services.xserver.libinput = {
    enable = true;
    horizontalScrolling = true;
  };

  #+ Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm = {
    enable = true;
    enableHidpi = true;
    autoNumlock = true;
  };
  services.xserver.desktopManager.plasma5 = { enable = true; };

  #+ flatpak support
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  #+ steam
  hardware.steam-hardware = { enable = true; };

  #+ emacs
  services.emacs = {
    enable = true;
    install = true;
    package = pkgs.emacs-nox;
    defaultEditor = true;
  };

  #+ lorri direnv manager
  services.lorri.enable = true;

  #+ qemu
  virtualisation.libvirtd = {
    enable = true;
    qemuOvmf = true;
  };

  #+ containers
  virtualisation.docker = {
    enable = true;
    storageDriver = "zfs";
  };

  #+ nix
  nixpkgs.config.allowUnfree = true;
  nix.useSandbox = true;

  #+ netdata monitoring
  services.netdata = {
    enable = true;
    group = "netdata";
    python.enable = true;
    python.extraPackages = ps: [ ps.docker ];
  };
  services.netdata.config = {
    global = {
      "memory mode" = "dbengine";
      "cache directory" = "/var/cache/netdata";
      "update every" = "2";
      "page cache size" = "126";
      "dbengine disk space" = "2000";
      "timezone" = "Europe/Vienna";
    };
  };

  #+ firmware
  hardware = {
    cpu.intel.updateMicrocode = false;
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
    enableAllFirmware = false;
  };

  #+ Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.stefan = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "netdata"
      "sanoid"
      "disk"
      "audio"
      "video"
      "zfs"
      "networkmanager"
      "systemd-journal"
      "docker"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

  system.stateVersion = "20.03"; # Did you read the comment?
  system.autoUpgrade.enable = true;
}
