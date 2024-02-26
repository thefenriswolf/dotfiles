{ config, pkgs, ... }: {
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
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
  environment = { systemPackages = with pkgs; [ power-calibrate ]; };
}
