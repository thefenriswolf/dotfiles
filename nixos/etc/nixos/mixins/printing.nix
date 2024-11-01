{ config, pkgs, ... }: {
  # discover network printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [
      pkgs.foomatic-db-ppds-withNonfreeDb
      pkgs.foomatic-db-ppds
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
    #paperwork
  ];
}
