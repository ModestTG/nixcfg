{ config, lib, ... }:

let
  cfg = config.ewhsModule.desktop.bluetooth;
in
{
  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    services.blueman.enable = true;
  };
}
