{ config, pkgs, ... }:
{

  #https://nixos.wiki/wiki/Podman
  environment.systemPackages = with pkgs; [
    distrobox
    fuse-overlayfs
    podman-compose
    runc
    crun
    #ventoy-full
  ];

  # nixos containers
  boot.enableContainers = true;
  virtualisation.containers.enable = true;

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "ro" ];
  users.users.ro.extraGroups = [ "libvirtd" ];
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
    };
    spiceUSBRedirection.enable = true;

    podman = {
      enable = true;
      defaultNetwork = {
        settings = {
          dns_enabled = true;
        };
      };
      autoPrune = {
        dates = "monthly";
        enable = true;
      };
    };
  };

}
