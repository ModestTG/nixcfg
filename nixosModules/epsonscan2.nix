{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    nixosModule.desktop.scanner.enable = lib.mkEnableOption "enable Epson Scanner support";
  };

  config = lib.mkIf config.nixosModule.desktop.scanner.enable {
    environment.systemPackages = with pkgs; [ epsonscan2 ];
    hardware.sane = {
      enable = true;
      extraBackends = [ pkgs.epsonscan2 ];
    };
  };
}
