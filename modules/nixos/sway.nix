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
  config = lib.mkIf (cfg.wm == "sway") {
    ewhsModule.desktop.displayProtocol = "wayland";
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      package = pkgs.swayfx;
    };
    environment.systemPackages = with pkgs; [
      autotiling
      dconf
      glib
      libnotify
      playerctl
      swayfx
      swww
      wayland
      wl-clipboard
      xdg-utils
    ];
    security.pam.services.swaylock = { };
  };
}
