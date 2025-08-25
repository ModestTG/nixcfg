{
  config,
  lib,
  pkgs,
  ...
}:

let
  lockCmd = "${pkgs.swaylock-effects}/bin/swaylock -fF";
  cfg = config.homeModule.desktop;
in
{
  config = lib.mkIf (cfg.wm == "sway") {
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
      events = [
        {
          event = "before-sleep";
          command = lockCmd;
        }
      ];
    };
  };
}
