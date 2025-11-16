{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nebnix";

  networking.networkmanager.enable = true;

  time.timeZone = "UTC";

  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
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

