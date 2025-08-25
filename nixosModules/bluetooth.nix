{ config, lib, ... }:

let
  cfg = config.nixosModule.desktop.bluetooth;
in
{
  options.nixosModule.desktop.bluetooth = {
    enable = lib.mkEnableOption "enable Bluetooth";
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    services.blueman.enable = true;
  };
}
