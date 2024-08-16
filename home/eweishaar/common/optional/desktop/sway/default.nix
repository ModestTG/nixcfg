{ pkgs, userlib, ... }:

{
  imports = userlib.scanPaths ./.;

  home.packages = with pkgs; [
    brave
    discord
    feh
    grim
    kolourpaint
    slurp
    spotify
    swappy
    xfce.thunar
  ];
}
