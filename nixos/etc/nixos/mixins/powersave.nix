{ config, pkgs, ... }: {

  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
        enable_thresholds = true;
        start_threshold = 20;
        stop_threshold = 80;
      };
      charger = {
        governor = "performance";
        turbo = "auto";
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
