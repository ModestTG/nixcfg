{ config, lib, ... }:

let
  cfg = config.nixosModule.virt;
in
{
  options.nixosModule.virt.platforms = lib.mkOption {
    type = lib.types.listOf (
      lib.types.enum [
        "docker"
        "podman"
      ]
    );
    default = [ ];
    description = "A list of container platforms to enable";
  };

  config = lib.mkIf (cfg.platforms != [ ]) {
    virtualisation.docker = lib.mkIf (lib.elem "docker" cfg.platforms) {
      enable = true;
      storageDriver = "overlay2";
    };
    virtualisation.podman = lib.mkIf (lib.elem "podman" cfg.platforms) {
      enable = true;
    };
  };

}
