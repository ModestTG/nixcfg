{
  osConfig,
  lib,
  pkgs,
  ...
}:

let
  lockCmd = "${pkgs.swaylock-effects}/bin/swaylock -fF";
  cfg = osConfig.ewhsModule.desktop;
in
{
  config = lib.mkIf (lib.elem "sway" cfg.wm) {
    services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 300;
          command = lockCmd;
        }
        {
          timeout = 305;
          command = "${pkgs.swayfx}/bin/swaymsg 'output * dpms off'";
          resumeCommand = "${pkgs.swayfx}/bin/swaymsg 'output * dpms on'";
        }
      ];
      events = {
        "before-sleep" = lockCmd;
      };
    };
  };
}
