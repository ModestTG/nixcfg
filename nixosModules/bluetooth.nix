{ config, lib, ... }:

{
  options = {
    nixosModule.desktop.bluetooth.enable = lib.mkEnableOption "enable Bluetooth";
  };

  config = lib.mkIf config.nixosModule.desktop.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    services.blueman.enable = true;
  };
}
