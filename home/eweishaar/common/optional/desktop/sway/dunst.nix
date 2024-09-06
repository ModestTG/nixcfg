{ inputs, pkgs, ... }:

{
  xdg.configFile."dunst/dunstrc".source = "${inputs.theme_tokyonight}/extras/dunst/tokyonight_night.dunstrc";
  services.dunst.iconTheme = {
    name = "Tokyonight-Dark";
    package = pkgs.tokyonight-gtk-theme;
  };
}
