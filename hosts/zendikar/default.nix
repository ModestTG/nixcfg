{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix 
      ../../modules/nixos/system.nix
      ../../modules/nixos/nfs-filebrowser.nix
      ../../modules/nixos/ssh.nix 
      ../../modules/nixos/firewall.nix
      ../../modules/nixos/desktop
    ];

  networking.hostName = "zendikar";  
  system.stateVersion = "23.11";
}

