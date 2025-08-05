{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:

{
  options = {
    homeModule.desktop.notifier = lib.mkOption {
      type = lib.types.enum [
        "dunst"
      ];
      default = "";
      description = "Specify which notifier to use";
    };
  };
  config = {
    services.dunst = lib.mkIf (config.homeModule.desktop.notifier == "dunst") {
      configFile = "${inputs.theme_tokyonight}/extras/dunst/tokyonight_night.dunstrc";
      iconTheme = {
        name = "Tokyonight-Dark";
        package = pkgs.tokyonight-gtk-theme;
      };
    };
  };
}
