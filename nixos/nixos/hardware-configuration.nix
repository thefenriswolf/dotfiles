# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [
    "ata_piix"
    "floppy"
    "ehci_pci"
    "sd_mod"
    "sr_mod"
    "xhci_pci"
    "usb_storage"
    "zfs"
    "nvme"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" "kvm-intel" "vfio-pci" "broadcom_sta" ];
  boot.blacklistedKernelModules = [ "nouveau" ];
  boot.extraModulePackages =
    [ pkgs.linuxPackages.bpftrace pkgs.linuxPackages.bcc ];

  # reset netdata at boot
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    zfs rollback -r rpool/netdata@blank
  '';

  fileSystems."/" = {
    device = "rpool/root/nixos";
    fsType = "zfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C82B-F601";
    fsType = "vfat";
  };

  fileSystems."/home" = {
    device = "rpool/root/home";
    fsType = "zfs";
  };

  fileSystems."var/cache/netdata" = {
    device = "rpool/root/netdata";
    fstype = "zfs";
  };

  fileSystems."/home/stefan/development" = {
    device = "rpool/home/dev";
    fsType = "zfs";
  };

  fileSystems."/nix" = {
    device = "rpool/nix";
    fsType = "zfs";
  };

  swapDevices = [{ device = "/dev/md127"; }];

  nix.maxJobs = lib.mkDefault 8;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  # virtualisation.hypervGuest.enable = true;
}
