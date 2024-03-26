{ config, pkgs, ... }: {
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  nixpkgs.config = { allowUnfree = true; };
  environment.systemPackages = [ pkgs.nvd ];
}
