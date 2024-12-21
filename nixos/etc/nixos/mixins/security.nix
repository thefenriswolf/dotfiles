{ config, lib, pkgs, ... }:

{
  boot.tmp.cleanOnBoot = true;
  security = {
    allowSimultaneousMultithreading = true;
    sudo = {
      enable = true;
      execWheelOnly = true;
    };

  };
}
