{ config, lib, ... }:

let
  cfg = config.nixosModule.desktop.usb;
in
{
  options.nixosModule.desktop.usb = {
    enable = lib.mkEnableOption "enable common USB support on desktop";
  };

  config = lib.mkIf cfg.enable {
    services.devmon.enable = true;
    services.gvfs.enable = true;
    services.udisks2.enable = true;
  };
}
