{ pkgs, userlib, inputs, ... }:

{
  imports = [
    inputs.base16.homeManagerModule
    { scheme = "${inputs.tt-themes}/base16/tokyo-night-terminal-dark.yaml"; }
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
