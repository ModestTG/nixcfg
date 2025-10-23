{ config, lib, ... }:

let
  cfg = config.ewhsModule.virt;
in
{
  config = {
    virtualisation.docker = lib.mkIf (lib.elem "docker" cfg.platforms) {
      enable = true;
      storageDriver = "overlay2";
    };
    virtualisation.podman = lib.mkIf (lib.elem "podman" cfg.platforms) {
      enable = true;
    };
  };

}
