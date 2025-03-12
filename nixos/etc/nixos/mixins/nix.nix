{ config, pkgs, ... }: {

  nix = {
    sshServe = {
      enable = true;
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILoB3A+XDzvLGzB5y4/znpWW21UNlgjuPZMPSNVKgStC ro@laptop-stefan"
      ];
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
  environment.systemPackages = [ pkgs.nvd pkgs.nixd ];
}
