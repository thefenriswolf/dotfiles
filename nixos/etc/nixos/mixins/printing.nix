{ config, pkgs, ... }: {
  # discover network printers
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.gutenprintBin pkgs.hplipWithPlugin ];
  };
  # scanner support
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.sane-airscan pkgs.sane-backends ];
  };
  environment.systemPackages = with pkgs; [
    sane-frontends
    libinsane
    paperwork
  ];
}
