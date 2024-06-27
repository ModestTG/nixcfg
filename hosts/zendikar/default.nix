{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix 
      ../../modules/nixos/common_configuration.nix
      ../../modules/nixos/nfs-filebrowser.nix
      ../../modules/nixos/ssh.nix 
      ../../modules/nixos/firewall.nix
      ../../modules/nixos/sway.nix
    ];

  networking.hostName = "zendikar";  
  system.stateVersion = "23.11";
}

