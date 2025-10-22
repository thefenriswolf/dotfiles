{ config, lib, pkgs, ... }:

{
  boot.tmp.cleanOnBoot = true;
  services.gnome.gnome-keyring.enable = true;
  services.clamav = {
    daemon.enable = false;
    updater.enable = false;
    updater.frequency = 1; # updates per day
  };

  programs.firejail.enable = true;

  security = {
    audit = {
      enable = false;
      rules = [ "-a exit,always -F arch=b64 -S execve" ];
    };
    rtkit.enable = true;
    polkit.enable = true;
    auditd.enable = false;
    allowSimultaneousMultithreading = true;
    sudo-rs = {
      enable = true;
      wheelNeedsPassword = true;
      execWheelOnly = true;
    };
    sudo = {
      enable = false;
      execWheelOnly = true;
    };
  };
}
