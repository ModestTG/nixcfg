{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix 
      ../../modules/nixos/desktop.nix
    ];

  networking.hostName = "zendikar";  
  system.stateVersion = "24.05";
}

