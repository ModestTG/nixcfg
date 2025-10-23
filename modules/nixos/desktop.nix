{ config, lib, ... }:

let
  cfg = config.ewhsModule.desktop;
in
{
  config = lib.mkIf cfg.enable {
    programs.dconf.enable = true;
    security.polkit.enable = true;
    services.dbus.enable = true;
    # USB Support
    services.devmon.enable = true;
    services.gvfs.enable = true;
    services.udisks2.enable = true;
  };
}
