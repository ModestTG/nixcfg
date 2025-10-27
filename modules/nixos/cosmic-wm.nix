{ config, lib, ... }:

let
  cfg = config.ewhsModule.desktop;
in
{
  config = lib.mkIf (lib.elem "cosmic" cfg.wm) {
    services.desktopManager.cosmic = {
      enable = true;
    };
  };
}
