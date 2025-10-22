{ pkgs, ... }:
let unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  services.lorri.enable = true;
  environment.systemPackages = with pkgs; [
    git
    tokei
    #godot-mono
    #godotPackages.export-template
    #godotPackages.export-template-mono

    unstable.zig
    #unstable.zls
    unstable.odin
    #unstable.ols
  ];
}

