# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./ssh.nix 
      ./firewall.nix
    ];

  ### NIX FLAKES
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  ### UNFREE
  nixpkgs.config.allowUnfree = true;

  ### BOOTLOADER 
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ### NETWORKING
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  
  ### TIMEZONE AND LOCALE
  time.timeZone = "US/Central";
  i18n.defaultLocale = "en_US.UTF-8";

  ### USERS
  users.users."eweishaar" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    description = "Elliot Weishaar";
    uid = 1000;
  };
  
  ### SYSTEM PACKAGES
  environment.systemPackages = with pkgs; [
    bash
    curl
    git
    home-manager
    tldr
    vim
    wget
  ];
}

