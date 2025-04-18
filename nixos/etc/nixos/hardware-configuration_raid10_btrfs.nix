# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./mixins/filesystem_btrfs.nix
    ./mixins/blacklist.nix
  ];

  services.ratbagd.enable = false; # for configurable gaming mice

  services.fwupd.enable = true;
  networking.hostId =
    "f092bcf0"; # needed for ZFS: head -c4 /dev/urandom | od -A none -t x4
  boot = {
    # kernelPackages = pkgs.linuxPackages_latest; # latest kernel
    # kernelPackages = pkgs.linuxPackages; # LTS kernel
    kernelPackages =
      config.boot.zfs.package.latestCompatibleLinuxPackages; # latest zfs kernel
    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
        "sdhci_pci"
        "amdgpu"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-amd" "zenpower" ];
    kernelParams = [
      #"elevator=none" DEPRECATED!!! for ZFS
      "quiet"
      "loglevel=3"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
      "nohibernate"
    ];
    extraModulePackages = [ config.boot.kernelPackages.zenpower ];
    supportedFilesystems = [ "ntfs" "btrfs" "ext4" "vfat" ];
  };

  services.btrfs.autoScrub.enable = true;

  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "btrfs";
    options = [ "subvol=root" "compress=zstd" "ssd" ];
  };

  fileSystems."/home" = {
    device = "/dev/sda1";
    fsType = "btrfs";
    options = [ "subvol=home" "compress=zstd" "ssd" ];
  };

  fileSystems."/nix" = {
    device = "/dev/sda1";
    fsType = "btrfs";
    options = [ "subvol=nix" "noatime" "compress=zstd" "ssd" ];
  };

  fileSystems."/var" = {
    device = "/dev/sda1";
    fsType = "btrfs";
    options = [ "subvol=var" "noatime" "compress=zstd" "ssd" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/A9A7-53FD";
    fsType = "vfat";
  };

  #swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp34s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
