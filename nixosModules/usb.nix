{ config, lib, ... }:

{
  options = {
    nixosModule.desktop.usb.enable = lib.mkEnableOption "enable common USB support on desktop";
  };

  config = lib.mkIf config.nixosModule.desktop.usb.enable {
    services.devmon.enable = true;
    services.gvfs.enable = true;
    services.udisks2.enable = true;
  };
}
