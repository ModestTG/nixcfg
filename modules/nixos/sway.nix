{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.ewhsModule.desktop;
in
{
  config = lib.mkIf (lib.elem "sway" cfg.wm) {
    ewhsModule.desktop.displayProtocol = "wayland";
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      package = pkgs.swayfx;
      extraPackages = with pkgs; [
        autotiling
        playerctl
        wl-clipboard
        xdg-utils
      ];
    };
    security.pam.services.swaylock = { };
  };
}
