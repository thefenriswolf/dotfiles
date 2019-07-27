# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
imports =
[ # Include the results of the hardware scan.
./hardware-configuration.nix
];

# Use the GRUB 2 boot loader.
boot.loader.grub.enable = true;
boot.loader.grub.version = 2;
boot.supportedFilesystems = ["zfs"];
boot.loader.grub.copyKernels = true;
boot.kernelModules = ["kvm-amd" "kvm-intel"];
# boot.loader.grub.efiSupport = true;
# boot.loader.grub.efiInstallAsRemovable = true;
# boot.loader.efi.efiSysMountPoint = "/boot/efi";
# Define on which hard drive you want to install Grub.
boot.loader.grub.device = 
"/dev/disk/by-id/ata-HGST_HTS545050A7E680_RBE50AM51BU73P-part2"; 
# or "nodev" for efi only

networking.hostName = "nixos"; # Define your hostname.
networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
networking.hostId = "994d9128";
# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Select internationalisation properties.
i18n = {
consoleFont = "Lat2-Terminus16";
consoleKeyMap = "de";
defaultLocale = "de_AT.UTF-8";
 };

# Set your time zone.
time.timeZone = "Europe/Vienna";

# List packages installed in system profile. To search, run:
# $ nix search wget
environment.systemPackages = with pkgs; [
wget nano
];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

# List services that you want to enable:

# Enable the OpenSSH daemon.
services.openssh.enable = true;

# Enable libvirtd
virtualisation.libvirtd.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# Enable CUPS to print documents.
# services.printing.enable = true;

# Enable sound.
sound.enable = true;
hardware.pulseaudio.enable = true;

# Enable the X11 windowing system.
services.xserver.enable = true;
services.xserver.layout = "de";
# services.xserver.xkbOptions = "eurosign:e";

# Enable touchpad support.
# services.xserver.libinput.enable = true;

# Enable the Desktop Environment.
services.xserver.displayManager.lightdm.enable = true;
services.xserver.desktopManager.xfce.enable = true;
# Install nvidia drivers
services.xserver.videoDrivers = [ "nvidiaLegacy390" ];
# ofc you have to enable nonfree software
nixpkgs.config.allowUnfree = true;
# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.stefan = {
isNormalUser = true;
extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
};

# This value determines the NixOS release with which your system is to be
# compatible, in order to avoid breaking some software such as database
# servers. You should change this only after NixOS release notes say you
# should.
system.stateVersion = "19.03"; # Did you read the comment?

}