{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager } # @attrs
    : {
      nixosConfigurations.laptop-stefan = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        #specialArgs = attrs;
        modules = [
          ./nixos/etc/nixos/configuration.nix
          # ./home-manager/.config/home-manager/home.nix
        ];
      };
    };
}
