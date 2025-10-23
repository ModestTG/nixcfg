{
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}:

let
  cfg = osConfig.ewhsModule.desktop;
in
{
  config = lib.mkIf cfg.enable {
    services.dunst = lib.mkIf (cfg.notifier == "dunst") {
      enable = true;
      configFile = "${inputs.theme_tokyonight}/extras/dunst/tokyonight_night.dunstrc";
      iconTheme = {
        name = "Tokyonight-Dark";
        package = pkgs.tokyonight-gtk-theme;
      };
    };
  };
}
