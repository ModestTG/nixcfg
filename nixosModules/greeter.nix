{ config, lib, ... }:

let
  cfg = config.home-manager.users.eweishaar.homeModule.desktop;
in
{
  config = lib.mkIf cfg.enable {
    services.displayManager.ly = lib.mkIf (cfg.displayManager == "ly") {
      enable = true;
    };
  };
}
