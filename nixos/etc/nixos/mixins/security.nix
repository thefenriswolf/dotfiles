{ config, lib, pkgs, ... }:

{
  boot.tmp.cleanOnBoot = true;
  services.gnome.gnome-keyring.enable = true;
  services.clamav = {
    daemon.enable = false;
    updater.enable = true;
    updater.frequency = 1; # updates per day
  };

  security = {
    audit = {
      enable = false;
      rules = [ "-a exit,always -F arch=b64 -S execve" ];
    };
    rtkit.enable = true;
    polkit.enable = true;
    auditd.enable = true;
    allowSimultaneousMultithreading = true;
    sudo = {
      enable = true;
      execWheelOnly = true;
    };
  };
}
