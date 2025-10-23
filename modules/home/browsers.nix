{
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}:

let
  cfg = osConfig.ewhsModule;
in
{
  imports = [ inputs.zen-browser.homeModules.twilight ];

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
