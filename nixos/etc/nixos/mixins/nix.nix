{ config, pkgs, ... }: {

  nix = {
    sshServe = {
      enable = false;
      keys = [ ];
      # example:
      # nixos-rebuild --option substituters "http://binarycache.example.com" --option trusted-public-keys "binarycache.example.com-1:dsafdafDFW123fdasfa123124FADSAD" switch
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
    };
  };

  nixpkgs.config = { allowUnfree = true; };
  environment.systemPackages = [ pkgs.nixfmt-classic pkgs.nixd ];
}
