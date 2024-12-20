{ config, pkgs, ... }: {

  #https://nixos.wiki/wiki/Podman
  environment.systemPackages = with pkgs; [
    distrobox
    flyctl
    fuse-overlayfs
    podman-compose
    podman-tui
    runc
    crun
    pods
    xorg.xhost
    ventoy-full
  ];

  virtualisation = {
    podman = {
      enable = true;
      defaultNetwork = { settings = { dns_enabled = true; }; };
      autoPrune = {
        dates = "monthly";
        enable = false;
      };
    };
  };

}
