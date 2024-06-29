{ config, pkgs, ... }: {

  nix = {
    optimise.automatic = true;
    gc = {
      automatic = false;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  nixpkgs.config = { allowUnfree = true; };
  environment.systemPackages = [ pkgs.nvd pkgs.nixd ];
}
