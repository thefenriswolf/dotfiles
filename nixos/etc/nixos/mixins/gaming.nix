{
  pkgs,
  ...
}:

{
  hardware.amdgpu = {
    initrd.enable = true;
    amdvlk = {
      enable = true;
    };
  };

  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        inhibit_screensaver = 0;
        renice = 10;
      };
      custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
        end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
      };
    };
  };
  fonts.fontconfig.cache32Bit = true;
  programs.steam = {
    enable = true;
    extest.enable = true;
    localNetworkGameTransfers.openFirewall = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = false;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    extraPackages = with pkgs; [ gamescope ];
  };
  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
  ];
}
