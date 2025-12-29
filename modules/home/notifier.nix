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
    };
  };
}
