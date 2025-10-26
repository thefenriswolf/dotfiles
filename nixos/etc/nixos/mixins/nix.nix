{ config, pkgs, ... }: {

  # system.rebuild.enableNg = true;
  # system.switch.enableNg = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/ro/playground/dotfiles";
  };

  services.nix-serve = {
    enable = false;
    openFirewall = true;
    port = 6969;
  };

  nix = {
    sshServe = {
      enable = false;
      trusted = true;
      keys = [ ];
    };
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
      trusted-substituters = [ ];
    };
  };
  nixpkgs.config = {
    permittedInsecurePackages = [ "mbedtls-2.28.10" ]; # TODO: remove once fixed
    allowUnfree = true;
  };
  environment.systemPackages = [ pkgs.nixfmt-rfc-style pkgs.nixd ];
}
