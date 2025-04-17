{ config, pkgs, ... }: {

  services.thermald.enable = true; # always leave on on Laptops
  powerManagement.powertop.enable = false; # auto tune powertop

  services = {
    bpftune.enable = true;
    auto-cpufreq = {
      enable = true; # enable either auto-cpufreq or TLP
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
          turbo = "auto";
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
        TLP_DEFAULT_MODE = "BAT"; # default power profile after boot
        TLP_PERSISTENT_DEFAULT =
          0; # 0: autoselect power profile, 1: always choose default profile
        RUNTIME_PM_ON_AC = "auto"; # also try to save power on AC

        RESTORE_THRESHOLDS_ON_BAT = 1;
        START_CHARGE_THRESH_BAT0 = 45;
        STOP_CHARGE_THRESH_BAT0 = 75;
        START_CHARGE_THRESH_BAT1 = 45;
        STOP_CHARGE_THRESH_BAT1 = 75;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth wwan";
        DEVICES_TO_ENABLE_ON_STARTUP = "wifi";

        DEVICES_TO_DISABLE_ON_LAN_CONNECT = "wifi wwan";
        DEVICES_TO_DISABLE_ON_WIFI_CONNECT = "wwan";
        DEVICES_TO_DISABLE_ON_WWAN_CONNECT = "wifi";

        WOL_DISABLE = "Y"; # disable wake on lan, I never use it

        RUNTIME_PM_DRIVER_DENYLIST =
          "nouveau nvidia"; # don't try to manage NVIDIA GPU

        USB_EXCLUDE_PHONE = "Y";
        USB_AUTOSUSPEND = 1;

        NATACPI_ENABLE = 1; # general battery care
        TPSMAPI_ENABLE = 1; # thinkpad battery care
        #TPACPI_ENABLE = 1;
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
    systemPackages = with pkgs;
      [
        # power-calibrate
        # lact
        # powertop
      ];
  };
}
