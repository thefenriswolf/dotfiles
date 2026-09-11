{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  # auto-enable appimage-run
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  services.flatpak = {
    enable = true;
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
    packages = [
      "org.gnome.Boxes"
      "org.ferdium.Ferdium"
      "com.github.tchx84.Flatseal"
      "io.github.giantpinkrobots.flatsweep"
    ];
  };
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
