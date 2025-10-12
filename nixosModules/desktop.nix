{ config, lib, ... }:

let
  hcfg = config.home-manager.users.eweishaar.homeModule.desktop;
in
{
  config = lib.mkIf hcfg.enable {
    security.polkit.enable = true;
    services.dbus.enable = true;
    programs.dconf.enable = true;
  };
}
