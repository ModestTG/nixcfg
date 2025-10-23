{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.ewhsModule.desktop.scanner;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ epsonscan2 ];
    hardware.sane = {
      enable = true;
      extraBackends = [ pkgs.epsonscan2 ];
    };
  };
}
