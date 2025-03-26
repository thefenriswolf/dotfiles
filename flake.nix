# https://github.com/nmasur/dotfiles/blob/b282e76be4606d9f2fecc06d2dc8e58d5e3514be/flake.nix
# https://nixos-and-flakes.thiscute.world/nixos-with-flakes/start-using-home-manager
# https://github.com/wimpysworld/nix-config/blob/main/flake.nix
{
  description = "thefenriswolf's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/nur";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      stateVersion = "24.11";
      helper = import ./lib { inherit inputs outputs stateVersion; };
    in {
      nixosConfigurations = {
        desktop-stefan = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nixos/etc/nixos/configuration.nix
            ./nixos/etc/nixos/hardware-configuration_raid10.nix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.ro = import ./home-manager/.config/home-manager/home.nix;
              };
            }
          ];
        };
        laptop-stefan = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nixos/etc/nixos/configuration.nix
            ./nixos/etc/nixos/hardware-configuration_sd_zfs.nix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.ro = import ./home-manager/.config/home-manager/home.nix;
              };
            }
          ];
        };
      };
    };
}
