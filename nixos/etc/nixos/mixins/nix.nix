{ config, pkgs, ... }: {

  system.rebuild.enableNg = true;
  system.switch.enableNg = true;

  services.ncps = { # https://github.com/kalbasit/ncps
    enable = true;
    upstream.caches = [ "https://cache.nixos.org" ];
    openTelemetry.enable = false;
  };

  nix = {
    sshServe = {
      enable = false;
      keys = [ ];
    };
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      allowed-users = [ "@wheel" ];
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      substituters = [ "http://192.168.1.108" ];
      trusted-public-keys =
        [ "laptop-stefan:wKNpmUwSoyIZl4HO3bqwOAqKXbvJ3WkWHuXgskwxPSk=" ];
    };
  };

  nixpkgs.config = { allowUnfree = true; };
  environment.systemPackages = [ pkgs.nixfmt-classic pkgs.nixd ];
}
