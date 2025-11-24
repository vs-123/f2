{ config, lib, pkgs, ... }:

{
  imports = [ /etc/nixos/hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nebnix";

  networking.networkmanager.enable = true;

  time.timeZone = "UTC";

  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
    extraConfig = ''
    Section "Monitor"
      Identifier "Virtual-1"
      Modeline "1800x1150_60.00"  173.25  1800 1920 2112 2424  1150 1153 1163 1193 -hsync +vsync
    EndSection
    '';
  };

  services.displayManager = {
    enable = true;
    ly.enable = true;
  };

  
  users.users.neb = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
  ];

  system.stateVersion = "25.11";
  nix.settings.experimental-features = ["nix-command" "flakes"];
}

