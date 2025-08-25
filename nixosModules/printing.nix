{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.nixosModule.desktop.brother-printer;
in
{
  options.nixosModule.desktop.brother-printer = {
    enable = lib.mkEnableOption "enable Brother Printer support";
  };

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
