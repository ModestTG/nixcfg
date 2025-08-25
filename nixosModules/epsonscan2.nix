{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.nixosModule.desktop.scanner;
in
{
  options.nixosModule.desktop.scanner = {
    enable = lib.mkEnableOption "enable Epson Scanner support";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ epsonscan2 ];
    hardware.sane = {
      enable = true;
      extraBackends = [ pkgs.epsonscan2 ];
    };
  };
}
