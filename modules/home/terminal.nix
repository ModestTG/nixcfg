{
  osConfig,
  lib,
  inputs,
  pkgs-stable,
  ...
}:

let
  cfg = osConfig.ewhsModule;
  font-family = "FiraCode Nerd Font Propo";
in
{
  config = {
    programs.alacritty = lib.mkIf (cfg.terminal == "alacritty") {
      enable = true;
      settings = {
        general.import = [ "${inputs.theme_tokyonight}/extras/alacritty/tokyonight_night.toml" ];
        font = {
          size = 12;
          normal = {
            family = font-family;
            style = "Regular";
          };
        };
        window.opacity = 0.9;
      };
    };
    programs.ghostty = lib.mkIf (cfg.terminal == "ghostty") {
      enable = true;
      installBatSyntax = true;
      package = pkgs-stable.ghostty;
      settings = {
        inherit font-family;
        theme = "tokyonight";
        background-opacity = 0.9;
        window-decoration = false;
        gtk-single-instance = true;
        confirm-close-surface = false;
      };
    };
  };
}
