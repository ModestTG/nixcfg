{ config, lib, ... }:

{
  options = {
    nixosModule.virt.docker.enable = lib.mkEnableOption "enable Docker";
  };

  config = lib.mkIf config.nixosModule.virt.docker.enable {
    virtualisation.docker = {
      enable = true;
      storageDriver = "overlay2";
    };
  };

}
