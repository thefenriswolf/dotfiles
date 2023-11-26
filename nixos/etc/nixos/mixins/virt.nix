{ config, pkgs, ... }: {

  #https://nixos.wiki/wiki/Podman
  environment.systemPackages = with pkgs; [
    distrobox
    flyctl
    fuse-overlayfs
    podman-compose
    podman-tui
    podman
    pods
    xorg.xhost
  ];
  virtualisation = {
    podman = {
      defaultNetwork.settings = { dns_enabled = true; };
      autoPrune = {
        dates = "monthly";
        enable = true;
      };
      dockerCompat = true;
      dockerSocket.enable = true;
      enable = true;
    };
  };

}
