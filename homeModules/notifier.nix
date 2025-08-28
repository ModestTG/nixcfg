{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:

let
  cfg = config.homeModule.desktop;
in
{
  options.homeModule.desktop.notifier = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = "Specify which notifier to use";
  };
  config = {
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
