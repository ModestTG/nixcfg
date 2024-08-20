{ pkgs, userlib, inputs, ... }:

{
  imports = [
    inputs.base16.homeManagerModule
    { scheme = (userlib.relativeToRoot "config/tokyonight-night-base16.yaml"); }
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
