# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  services.fwupd.enable = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    initrd = {
      availableKernelModules =
        [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" "sdhci_pci" ];
      kernelModules = [ ];
    };
    blacklistedKernelModules = lib.mkDefault [ "nouveau" ];
    kernelModules = [ "kvm-amd" ];
    kernelParams =
      [ "quiet" "loglevel=3" "systemd.show_status=auto" "rd.udev.log_level=3" ];
    extraModprobeConfig = ''
      options iwlwifi 11n_disable=1
      options iwlwifi power_save=0
      options iwlmvm power_scheme=1
    '';
    extraModulePackages = [ ];
    supportedFilesystems = [ "ntfs" "btrfs" "ext4" "vfat" ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/983358f1-475f-4a33-bae0-9050b62f2cfc";
    fsType = "btrfs";
    options = [ "subvol=root" "compress=zstd" "noatime" "ssd" "discard=async" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/983358f1-475f-4a33-bae0-9050b62f2cfc";
    fsType = "btrfs";
    options = [ "subvol=home" "compress=zstd" "noatime" "ssd" "discard=async" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/983358f1-475f-4a33-bae0-9050b62f2cfc";
    fsType = "btrfs";
    options = [ "subvol=nix" "compress=zstd" "noatime" "ssd" "discard=async" ];
  };

  fileSystems."/var" = {
    device = "/dev/disk/by-uuid/983358f1-475f-4a33-bae0-9050b62f2cfc";
    fsType = "btrfs";
    options = [ "subvol=var" "compress=zstd" "noatime" "ssd" "discard=async" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/319F-0F5F";
    fsType = "vfat";
  };

  swapDevices = [ { device = "/swap/swapfile"; } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware = {
    enableAllFirmware = false;
    enableRedistributableFirmware = true;
    cpu.amd.updateMicrocode =
      lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
