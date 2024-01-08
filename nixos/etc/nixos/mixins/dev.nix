{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ bintools busybox ];
}
