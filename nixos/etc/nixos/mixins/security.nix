{ config, lib, pkgs, ... }:

{
  boot.tmp.cleanOnBoot = true;
  security = {
    audit = {
      enable = true;
      rules = [ "-a exit,always -F arch=b64 -S execve" ];
    };
    auditd.enable = true;
    allowSimultaneousMultithreading = true;
    sudo = {
      enable = true;
      execWheelOnly = true;
    };

  };
}
