{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix 
      ../../modules/common_configuration.nix
      ../../modules/wayland.nix
      ../../modules/nfs-filebrowser.nix
      inputs.home-manager.nixosModules.default
    ];



  networking.hostName = "zendikar";  
  home-manager = {
    extraSpecialArgs = {inherit inputs; };
    users = {
      "eweishaar" = import ./home.nix;
    };
  };
}

