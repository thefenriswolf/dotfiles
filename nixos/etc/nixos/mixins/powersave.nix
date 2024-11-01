{ config, pkgs, ... }: {

  services.thermald.enable = true;
  powerManagement.powertop.enable = true; # auto tune powertop
  services = {
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          # cpu
          governor = "powersave";
          engergy_performance_preference = "powersave";
          platform_profile = "powersave";
          #energy_perf_bias="balance_performance"; # for intel
          turbo = "never";
          #scaling_min_freq=;
          #scaling_max_freq=;
          # battery
          enable_thresholds = true;
          start_threshold = 30;
          stop_threshold = 80;
        };
        charger = {
          governor = "performance";
          engergy_performance_preference = "powersave";
          platform_profile = "powersave";
          #energy_perf_bias="balance_performance"; # for intel
          turbo = "never";
          #scaling_min_freq=;
          #scaling_max_freq=;
          # battery
          enable_thresholds = true;
          start_threshold = 30;
          stop_threshold = 80;
        };
      };
    };

    power-profiles-daemon.enable = false; # enable either tlp or auto-cpufreq
    tlp = {
      enable = false; # enable either tlp or auto-cpufreq
      settings = {
        TLP_ENABLE = 1;
        TLP_DEFAULT_MODE = "BAT";
        TLP_PERSISTENT_DEFAULT = 1;
        RESTORE_THRESHOLDS_ON_BAT = 1;
        START_CHARGE_THRESH_BAT0 = 75;
        STOP_CHARGE_THRESH_BAT0 = 80;
        START_CHARGE_THRESH_BAT1 = 75;
        STOP_CHARGE_THRESH_BAT1 = 80;
        NATACPI_ENABLE = 1;
        TPACPI_ENABLE = 1;
        TPSMAPI_ENABLE = 1;
      };
    };
  };

  services.ananicy = {
    enable = false;
    package = pkgs.ananicy-cpp;
    extraRules = [{
      name = "SlicerApp-real";
      nice = -19;
      sched = "normal";
      ioclass = "best-effort";
    }];
  };

  systemd.services.lactd = {
    description = "AMDGPU Control Daemon";
    enable = false;
    serviceConfig = { ExecStart = "${pkgs.lact}/bin/lact daemon"; };
    wantedBy = [ "multi-user.target" ];
  };

  environment = {
    systemPackages = with pkgs; [
      power-calibrate
      # lact
      powertop
    ];
  };
}
