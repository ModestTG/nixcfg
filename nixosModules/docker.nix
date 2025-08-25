{ config, lib, ... }:

let
  cfg = config.nixosModule.virt.docker;
in
{
  options.nixosModule.virt.docker = {
    enable = lib.mkEnableOption "enable Docker";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      storageDriver = "overlay2";
    };
  };

}
