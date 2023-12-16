{ config, pkgs, ... }:

{
  imports =
    [ 
      ../../modules/common_configuration.nix
      ../../modules/wayland.nix
      ../../modules/nfs-filebrowser.nix
    ];

  ### SSH Private Key
  
}

