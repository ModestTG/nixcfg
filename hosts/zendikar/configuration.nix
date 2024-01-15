{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix 
      ../../modules/nixos/common_configuration.nix
      ../../modules/nixos/hyprland.nix
      ../../modules/nixos/nfs-filebrowser.nix
      ../../modules/nixos/ssh.nix 
      ../../modules/nixos/firewall.nix
      inputs.home-manager.nixosModules.default
    ];

  networking.hostName = "zendikar";  
  home-manager = {
    extraSpecialArgs = {inherit inputs; };
    users = {
      "eweishaar" = import ./home.nix;
    };
  };
  environment.systemPackages = with pkgs; [
    discord
  ];
  system.stateVersion = "23.11";
}

