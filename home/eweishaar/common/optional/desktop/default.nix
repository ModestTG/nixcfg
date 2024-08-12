{pkgs, userlib, ...}:

{
  imports = userlib.scanPaths ./.;

  home.packages = with pkgs; [
    brave
    discord
    spotify
    wofi
  ];
}
