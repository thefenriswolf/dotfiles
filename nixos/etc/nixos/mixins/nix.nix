{ config, pkgs, ... }: {

  nix = {
    package = pkgs.lix;
    optimise.automatic = true;
    gc = {
      automatic = false;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      allowed-users = [ "@wheel" ];
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  nixpkgs.config = { allowUnfree = true; };
  environment.systemPackages = [ pkgs.nvd pkgs.nixd ];
}
