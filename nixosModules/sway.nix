{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.nixosModule.desktop.sway;
in
{
  options.nixosModule.desktop.sway = {
    enable = lib.mkEnableOption "enable Sway desktop";
  };

  config = lib.mkIf cfg.enable {
    security.polkit.enable = true;
    services.dbus.enable = true;
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --remember --time --theme 'border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red' --cmd ${pkgs.swayfx}/bin/sway";
          user = "eweishaar";
        };
      };
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
    programs.dconf.enable = true;
    security.pam.services.swaylock = { };
  };
}
