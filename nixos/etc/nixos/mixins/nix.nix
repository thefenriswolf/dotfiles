{
  pkgs,
  inputs,
  lib,
  ...
}:
{

  nixpkgs.config.permittedInsecurePackages = [
    "pnpm-9.15.9"
  ];

  nix.sshServe.enable = true;

  programs.nix-ld = {
    enable = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/ro/playground/dotfiles";
  };

  nix = {
    optimise.automatic = true;
    gc = {
      automatic = false;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      allowed-users = [ "@wheel" ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    rocmSupport = true;
  };
  environment.systemPackages = [
    pkgs.nixfmt
    pkgs.nixd
    pkgs.nix-tree
  ];
}
