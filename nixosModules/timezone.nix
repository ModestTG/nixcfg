{ config, lib, ... }:

let
  cfg = config.nixosModule;
in
{
  options.nixosModule.etc-timezone = lib.mkEnableOption "Enable creation of /etc/timezone";

  config = lib.mkIf cfg.etc-timezone {
    system.activationScripts.timezoneFile.text = ''
      echo ${config.time.timeZone} > /etc/timezone
    '';
  };
}
