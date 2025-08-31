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
      enable = true;
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN6UP5STE2pEgdRRS7mLnRYAENNWL+Tox/P7VGXSyHNE ro@desktop-stefan"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINEEJdsCP4JLaSOuQYTQxbjQgudrBK4kQblWuU6mmN+I ro@laptop-stefan"
      ];
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
    };
  };
  nixpkgs.config = { allowUnfree = true; };
  environment.systemPackages = [ pkgs.nixfmt-classic pkgs.nixd ];
}
