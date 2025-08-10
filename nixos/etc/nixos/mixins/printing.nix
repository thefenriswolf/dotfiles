{ config, pkgs, inputs, ... }:
let
  uvtools = import ./custom-packages/uvtools.nix { inherit pkgs; };
  #lychee = import ./custom-packages/lychee.nix { inherit pkgs; };
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  # discover network printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    webInterface = true;
    openFirewall = false;
    startWhenNeeded = true;
    tempDir = "/tmp";
    drivers = [
      pkgs.canon-cups-ufr2
      pkgs.canon-capt
      pkgs.gutenprintBin
      pkgs.gutenprint
      pkgs.hplipWithPlugin
    ];
  };
  # scanner support
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.sane-airscan pkgs.sane-backends ];
  };
  environment.systemPackages = with pkgs; [
    sane-frontends
    libinsane
    ink

    uvtools
    unstable.lychee
    #paperwork
  ];
}
