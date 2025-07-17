{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    nixosModule.desktop.brother-printer.enable = lib.mkEnableOption "enable Brother Printer support";
  };

  config = lib.mkIf config.nixosModule.desktop.brother-printer.enable {
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
