{ config, lib, ... }:

let
  cfg = config.nixosModule.svc.tailscale;
in
{
  options.nixosModule.svc.tailscale = {
    enable = lib.mkEnableOption "enable Tailscale service";
  };

  config = lib.mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
  };
}
