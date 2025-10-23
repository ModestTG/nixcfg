{ config, lib, ... }:

let
  cfg = config.ewhsModule.desktop;
in
{
  config = lib.mkIf cfg.enable {
    services.displayManager.ly = lib.mkIf (cfg.displayManager == "ly") {
      enable = true;
    };
  };
}
