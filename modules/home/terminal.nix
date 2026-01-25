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
    };
    programs.kitty = lib.mkIf (cfg.terminal == "kitty") {
      enable = true;
    };
    programs.ghostty = lib.mkIf (cfg.terminal == "ghostty") {
      enable = true;
      installBatSyntax = true;
      package = pkgs-stable.ghostty;
      settings = {
        window-decoration = false;
        gtk-single-instance = true;
        confirm-close-surface = false;
      };
    };
  };
}
