# https://github.com/nmasur/dotfiles/blob/b282e76be4606d9f2fecc06d2dc8e58d5e3514be/flake.nix
# https://nixos-and-flakes.thiscute.world/nixos-with-flakes/start-using-home-manager
# https://github.com/wimpysworld/nix-config/blob/main/flake.nix
# https://laniakita.com/blog/nixos-fde-tpm-hm-guide#introduction

{
  description = "thefenriswolf's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nur.url = "github:nix-community/nur";
    wrappers.url = "github:lassulus/wrappers";

    #   sops-nix = {
    #     url = "github:Mic92/sops-nix";
    #     inputs.nixpkgs.follows = "nixpkgs";
    #   };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak"; # unstable branch. Use github:gmodena/nix-flatpak/?ref=<tag> to pin releases.
    };

    #   neovim-nightly-overlay = {
    #     url = "github:nix-community/neovim-nightly-overlay";
    #     inputs.nixpkgs.follows = "nixpkgs-unstable";
    #   };

    tiddlydesktop = {
      url = "github:TiddlyWiki/TiddlyDesktop";
    };

  };
  outputs =
    {
      self,
      nixpkgs,
      sops-nix,
      nix-flatpak,
      nixos-hardware,
      nur,
      nixpkgs-unstable,
      # neovim-nightly-overlay,
      wrappers,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      stateVersion = "25.05";
      helper = import ./lib { inherit inputs outputs stateVersion; };
      overlays = [ ]; # inputs.neovim-nightly-overlay.overlays.default ];
    in
    {
      nixosConfigurations = {
        desktop-stefan = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/etc/nixos/configuration.nix
            ./nixos/etc/nixos/hardware-configuration_raid10_zfs.nix
            ./nixos/etc/nixos/mixins/host-desktop.nix

            ./nixos/etc/nixos/mixins/blacklist.nix
            ./nixos/etc/nixos/mixins/bluetooth.nix
            ./nixos/etc/nixos/mixins/cli.nix
            ./nixos/etc/nixos/mixins/core.nix
            ./nixos/etc/nixos/mixins/desktop.nix
            ./nixos/etc/nixos/mixins/dev.nix
            ./nixos/etc/nixos/mixins/editors.nix
            ./nixos/etc/nixos/mixins/nixvim.nix
            ./nixos/etc/nixos/mixins/filesystem_zfs.nix
            ./nixos/etc/nixos/mixins/gaming.nix
            ./nixos/etc/nixos/mixins/graphics.nix
            ./nixos/etc/nixos/mixins/locale.nix
            ./nixos/etc/nixos/mixins/networking.nix
            ./nixos/etc/nixos/mixins/nix.nix
            ./nixos/etc/nixos/mixins/git.nix
            ./nixos/etc/nixos/mixins/rgb.nix
            ./nixos/etc/nixos/mixins/non-nixpkgs.nix
            ./nixos/etc/nixos/mixins/performance.nix
            ./nixos/etc/nixos/mixins/powersave.nix
            ./nixos/etc/nixos/mixins/printing.nix
            ./nixos/etc/nixos/mixins/security.nix
            ./nixos/etc/nixos/mixins/sound.nix
            ./nixos/etc/nixos/mixins/ssh.nix
            ./nixos/etc/nixos/mixins/sync.nix
            ./nixos/etc/nixos/mixins/theming.nix
            ./nixos/etc/nixos/mixins/virt.nix

            { nixpkgs.overlays = overlays; }
          ];
        };
        laptop-stefan = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/etc/nixos/configuration.nix
            ./nixos/etc/nixos/hardware-configuration_sd_zfs.nix
            ./nixos/etc/nixos/mixins/host-laptop.nix

            ./nixos/etc/nixos/mixins/blacklist.nix
            ./nixos/etc/nixos/mixins/bluetooth.nix
            ./nixos/etc/nixos/mixins/ebpf.nix
            ./nixos/etc/nixos/mixins/cli.nix
            ./nixos/etc/nixos/mixins/core.nix
            ./nixos/etc/nixos/mixins/desktop.nix
            ./nixos/etc/nixos/mixins/dev.nix
            ./nixos/etc/nixos/mixins/editors.nix
            ./nixos/etc/nixos/mixins/gaming.nix
            ./nixos/etc/nixos/mixins/nixvim.nix
            ./nixos/etc/nixos/mixins/filesystem_zfs.nix
            ./nixos/etc/nixos/mixins/graphics.nix
            ./nixos/etc/nixos/mixins/locale.nix
            ./nixos/etc/nixos/mixins/networking.nix
            ./nixos/etc/nixos/mixins/nix.nix
            ./nixos/etc/nixos/mixins/git.nix
            ./nixos/etc/nixos/mixins/non-nixpkgs.nix
            ./nixos/etc/nixos/mixins/performance.nix
            ./nixos/etc/nixos/mixins/powersave.nix
            ./nixos/etc/nixos/mixins/printing.nix
            ./nixos/etc/nixos/mixins/security.nix
            ./nixos/etc/nixos/mixins/sound.nix
            ./nixos/etc/nixos/mixins/ssh.nix
            ./nixos/etc/nixos/mixins/sync.nix
            ./nixos/etc/nixos/mixins/theming.nix
            ./nixos/etc/nixos/mixins/virt.nix

            { nixpkgs.overlays = overlays; }
          ];
        };
      };
    };
}
