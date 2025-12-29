{
  osConfig,
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = osConfig.ewhsModule.desktop;
in
{
  config = lib.mkIf (lib.elem "sway" cfg.wm) {
    programs.swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
      settings = {
        show-failed-attempts = true;
        font-size = 24;
        screenshots = true;
        indicator-radius = 120; # Size of the indicator
        indicator-thickness = 8; # ; Thickness of the ring
        clock = true;
        indicator = true; # Show; indicator
        grace = 2; # ; Grace period for unlocking
        effect-blur = "7x5"; # Apply a blur effect
      };
    };
  };
}
