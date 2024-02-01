{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ bintools plantuml jdk ];
}
