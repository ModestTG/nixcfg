{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.homeModule;
in
{
  imports = [ inputs.zen-browser.homeModules.twilight ];

  options.homeModule.browser = lib.mkOption {
    type = lib.types.nullOr (
      lib.types.enum [
        "firefox"
        "helium"
        "zen"
      ]
    );
    description = "Enable a web browser";
    default = null;
  };

  config = {
    programs.firefox = lib.mkIf (cfg.browser == "firefox") {
      enable = true;
    };
    programs.zen-browser = lib.mkIf (cfg.browser == "zen") {
      enable = true;
    };
    home.packages = lib.mkIf (cfg.browser == "helium") [ pkgs.helium-browser ];
  };
}
