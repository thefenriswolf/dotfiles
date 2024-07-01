{ config, pkgs, ... }: {

  services = {
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
          enable_thresholds = false;
          start_threshold = 30;
          stop_threshold = 80;
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
    power-profiles-daemon.enable=false;
    tlp = {
      enable = true;
      settings = {
        TLP_ENABLE=1;
        RESTORE_THRESHOLDS_ON_BAT=1;
        START_CHARGE_THRESH_BAT0 = 75;
        STOP_CHARGE_THRESH_BAT0 = 80;
        START_CHARGE_THRESH_BAT1 = 75;
        STOP_CHARGE_THRESH_BAT1 = 80;
	      NATACPI_ENABLE=1;
        TPACPI_ENABLE=1;
        TPSMAPI_ENABLE=1;
      };
    };
  };

  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    extraRules = [{
      name = "SlicerApp-real";
      nice = -19;
      sched = "normal";
      ioclass = "best-effort";
    }];
  };

  environment = { systemPackages = with pkgs; [ power-calibrate ]; };
}
