{ pkgs, userlib, inputs, ... }:

{
  imports = [
    inputs.base16.homeManagerModule
  ] ++ (userlib.scanPaths ./.);

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
    zathura
  ];
}
