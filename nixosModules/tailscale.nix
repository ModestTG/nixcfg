{ config, lib, ... }:

{
  options = {
    nixosModule.svc.tailscale.enable = lib.mkEnableOption "enable Tailscale service";
  };

  config = lib.mkIf config.nixosModule.svc.tailscale.enable {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
  };
}
