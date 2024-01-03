{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/bash.nix
    ../../modules/home-manager/ssh.nix
    ../../modules/home-manager/hyprland.nix
  ];
  home.stateVersion = "23.11";
}
