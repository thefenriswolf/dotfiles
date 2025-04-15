# https://github.com/nmasur/dotfiles/blob/b282e76be4606d9f2fecc06d2dc8e58d5e3514be/flake.nix
# https://nixos-and-flakes.thiscute.world/nixos-with-flakes/start-using-home-manager
# https://github.com/wimpysworld/nix-config/blob/main/flake.nix
{
  description = "thefenriswolf's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    nur.url = "github:nix-community/nur";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, neovim-nightly, ... }@inputs:
    let
      inherit (self) outputs;
      stateVersion = "24.11";
      helper = import ./lib { inherit inputs outputs stateVersion; };
      overlays = [ neovim-nightly.overlay ];
    in {
      nixosConfigurations = {
        desktop-stefan = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nixos/etc/nixos/configuration.nix
            ./nixos/etc/nixos/hardware-configuration_raid10.nix
            ./nixos/etc/nixos/mixins/host-desktop.nix

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
            ./nixos/etc/nixos/mixins/host-laptop.nix

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
