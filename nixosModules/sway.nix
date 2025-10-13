{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.home-manager.users.eweishaar.homeModule.desktop;
in
{
  config = lib.mkIf (cfg.wm == "sway") {
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      package = pkgs.swayfx;
    };
    # services.greetd = {
    #   enable = true;
    #   settings = {
    #     default_session = {
    #       command = "${pkgs.tuigreet}/bin/tuigreet --remember --time --theme 'border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red' --cmd ${pkgs.swayfx}/bin/sway";
    #       user = "eweishaar";
    #     };
    #   };
    # };
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
