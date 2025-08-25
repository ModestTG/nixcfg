{
  config,
  lib,
  inputs,
  pkgs-stable,
  ...
}:

let
  cfg = config.homeModule;
  font-family = "FiraCode Nerd Font Propo";
in
{
  options.homeModule.terminal = lib.mkOption {
    type = lib.types.str;
    default = "alacritty";
    description = "Specify which terminal to use";
  };

  config = {
    programs.alacritty = lib.mkIf (cfg.terminal == "alacritty") {
      enable = true;
      settings = {
        general.import = [ "${inputs.theme_tokyonight}/extras/alacritty/tokyonight_night.toml" ];
        font = {
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
      enableBashIntegration = if cfg.shell == "bash" then true else false;
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
