{ config, desktop, lib, pkgs, ... }: {

  sound = {
    enable = true;
    mediaKeys = { enable = true; };
  };
  environment.systemPackages = with pkgs; [
    alsa-utils
    pulseaudio
    pulsemixer
    pavucontrol
  ];

  hardware = { pulseaudio.enable = lib.mkForce false; };
  security.rtkit.enable = true;
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = false;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}

