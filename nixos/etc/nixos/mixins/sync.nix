{
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    localsend
    syncthing
    syncthingtray
  ];

  programs.localsend = {
    enable = true;
    openFirewall = true; # port 53317
  };

  programs.kdeconnect = {
    enable = false;
    #package = pkgs.kdePackages.kdeconnect-kde;
  };

  services = {
    syncthing = {
      enable = true;
      group = "users";
      user = "ro";
      dataDir = "/home/ro/";
      configDir = "/home/ro/.config/syncthing";
      overrideDevices = true; # overrides any devices added or deleted through the WebUI
      overrideFolders = true; # overrides any folders added or deleted through the WebUI
      settings = {
        devices = {
          "Stefan_Galaxy" = {
            id = "PEN7RYR-VWYPT3H-MCG6NT4-G5SKH7Y-VSTYFBR-Z66U2JK-G7RLS56-OD6XKAC";
          };
          "Stefan_iPhone" = {
            id = "VIDKEEI-YHKNLMV-VN4KOGZ-B3YMEIE-D6JQGMZ-43E3VUJ-5GZDCX4-KOKGIA7";
          };
          "desktop-stefan" = {
            id = "2CBN5AW-EEMZYVR-TJ6NUI6-BTFO2YH-EPDIMON-Y3KPT4E-3P4QUBA-XBUVDQQ";
          };
          "laptop-stefan" = {
            id = "VR7DKOE-ROSGK3O-CRXZ3GS-UGZTPVQ-RPKQ6FG-U6WNCFO-QBDB6TC-AYQLWAR";
          };
        };
        folders = {
          "notes" = {
            # Name of folder in Syncthing, also the folder ID
            path = "/home/ro/notes"; # Which folder to add to Syncthing
            devices = [
              "desktop-stefan"
              "laptop-stefan"
              "Stefan_iPhone"
              "Stefan_Galaxy"
            ]; # Which devices to share the folder with
          };
          "shared_media" = {
            path = "/home/ro/shared_media";
            devices = [
              "desktop-stefan"
              "laptop-stefan"
              "Stefan_iPhone"
              "Stefan_Galaxy"
            ];
          };
        };
      };
    };
  };
  networking.firewall.allowedTCPPorts = [
    8384
    22000
  ];
  networking.firewall.allowedUDPPorts = [
    22000
    21027
  ];

}
