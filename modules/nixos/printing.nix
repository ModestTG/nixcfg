{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.ewhsModule.desktop.brother-printer;
in
{
  config = lib.mkIf cfg.enable {
    services.printing = {
      enable = true;
      drivers = [ pkgs.cups-brother-hll3230cdw ];
    };
    services.avahi = {
      enable = true;
      nssmdns4 = true;
    };
  };
}
