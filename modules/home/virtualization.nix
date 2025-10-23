{
  osConfig,
  lib,
  pkgs,
  ...
}:

let
  cfg = osConfig.ewhsModule;
in
{
  services.podman = lib.mkIf (lib.elem "podman" cfg.virt.platforms) {
    enable = true;
    autoUpdate.enable = true;
    settings = {
      storage = {
        storage.options.overlay.mount_program = "${pkgs.fuse-overlayfs}/bin/fuse-overlayfs";
      };
    };
  };
}
