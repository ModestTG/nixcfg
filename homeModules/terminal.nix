{
  config,
  lib,
  inputs,
  ...
}:

{
  options = {
    homeModule.terminal = lib.mkOption {
      type = lib.types.str;
      default = "alacritty";
      description = "Specify which terminal to use";
    };
  };

  config =
    let
      font-family = "FiraCode Nerd Font Propo";
    in
    {
      programs.alacritty = lib.mkIf (config.homeModule.terminal == "alacritty") {
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
      programs.ghostty = lib.mkIf (config.homeModule.terminal == "ghostty") {
        enable = true;
        enableBashIntegration = if config.homeModule.shell == "bash" then true else false;
        installBatSyntax = true;
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
