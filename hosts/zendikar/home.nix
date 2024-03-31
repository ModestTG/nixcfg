{ config, pkgs, lib,... }:

{
  imports = [
    ../../modules/home-manager/bash.nix
    ../../modules/home-manager/ssh.nix
    ../../modules/home-manager/hyprland.nix
    ../../modules/home-manager/alacritty.nix
    ../../modules/home-manager/neovim.nix
  ];
  wayland.windowManager.hyprland.settings = {
    "monitor" = lib.mkForce ",preferred,auto,2";
  };
  
  home.stateVersion = "23.11";
}
