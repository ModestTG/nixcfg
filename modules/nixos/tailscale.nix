{ config, lib, ... }:

let
  cfg = config.ewhsModule.svc.tailscale;
in
{
  config = lib.mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
  };
}
