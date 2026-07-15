{ config, pkgs, ... }:
{

  nix.sshServe.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINEEJdsCP4JLaSOuQYTQxbjQgudrBK4kQblWuU6mmN+I ro@192.168.1.114"
  ];
  networking.hostName = "desktop-stefan";
}
