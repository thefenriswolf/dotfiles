# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./mixins/filesystem_zfs.nix
    ./mixins/blacklist.nix
  ];

  services.fwupd.enable = true;
  networking.hostId = "8c884ab5";

  boot = {
    initrd = {
      availableKernelModules =
        [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" "sdhci_pci" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-amd" "zenpower" ];
    extraModulePackages = [ config.boot.kernelPackages.zenpower ];
    kernelPackages =
      pkgs.linuxPackages_6_12; # TODO: EOL: 12/2026 -> https://www.kernel.org/releases.html
    kernelParams = [
      ## intel
      #"intel_pstate=disable"

      ## amd: disable pstate in favour of auto-cpufreq
      "initcall_blacklist=amd_pstate_init"
      "amd_pstate.enable=0"

      "quiet"
      "loglevel=3"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
      "nohibernate"
      "acpi_backlight=native"
    ];
    extraModprobeConfig = ''
      options iwlwifi 11n_disable=1
      options iwlwifi power_save=0
      options iwlmvm power_scheme=1
    '';
    supportedFilesystems = [ "zfs" "vfat" "ntfs" ];
  };
  fileSystems."/" = {
    device = "rpool/root";
    fsType = "zfs";
  };

  fileSystems."/home" = {
    device = "rpool/home";
    fsType = "zfs";
  };

  fileSystems."/nix" = {
    device = "rpool/nix";
    fsType = "zfs";
  };

  fileSystems."/var" = {
    device = "rpool/var";
    fsType = "zfs";
  };

  fileSystems."/home/ro/storage" = {
    device = "dpool/storage";
    fsType = "zfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/CF0D-B414";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  # swapDevices =
  #   [{ device = "/dev/disk/by-uuid/811578c0-a02d-41ea-bb7d-47d5fef48a88"; }];
  zramSwap.enable = true;

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
