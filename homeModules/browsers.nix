{
  config,
  inputs,
  lib,
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
  };
}
