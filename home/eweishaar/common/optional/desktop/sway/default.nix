{
  pkgs,
  userlib,
  inputs,
  ...
}:

{
  imports = [
    inputs.base16.homeManagerModule
    { scheme = (userlib.relativeToRoot "config/tokyonight-night-base16.yaml"); }
  ] ++ (userlib.scanPaths ./.);

  home = {
    packages = with pkgs; [
      brave
      discord
      feh
      grim
      kolourpaint
      obsidian
      playerctl
      python3
      slurp
      spotify
      swappy
      xfce.thunar
      zathura
    ];
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.vimix-cursors;
      name = "Vimix-cursors";
      size = 22;
    };
  };
}
