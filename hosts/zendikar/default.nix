{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix 
      ../../modules/nixos/desktop
    ];

  networking.hostName = "zendikar";  
  system.stateVersion = "23.11";
}

