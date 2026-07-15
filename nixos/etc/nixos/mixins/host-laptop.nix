{ config, pkgs, ... }:
{
  nix.sshServe.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN6UP5STE2pEgdRRS7mLnRYAENNWL+Tox/P7VGXSyHNE ro@192.168.1.112"
  ];

  networking.hostName = "laptop-stefan";
}
