{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.homeModule.desktop;
in
{
  config = lib.mkIf (cfg.wm == "sway") {
    programs.swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
      settings = with config.scheme; {
        show-failed-attempts = true;
        font-size = 24;
        screenshots = true;
        inside-color = base00 + "ff"; # Inside the ring
        inside-clear-color = base01 + "ff"; # Inside when cleared
        inside-ver-color = base01 + "ff"; # Inside when verifying
        inside-wrong-color = base08 + "ff"; # Inside when wrong password
        ring-color = base01 + "ff"; # Normal ring
        ring-clear-color = base14 + "ff"; # Ring for cleared state
        ring-ver-color = base0E + "ff"; # Ring when verifying
        ring-wrong-color = base08 + "ff"; # Ring for wrong password
        line-color = "00000000"; # Line between sections (transparent)
        line-clear-color = "00000000"; # Line when cleared
        line-ver-color = "00000000"; # Line when verifying
        line-wrong-color = "00000000"; # Line when wrong password
        text-color = base06 + "ff"; # Text
        text-clear-color = base06 + "ff"; # Text when cleared
        text-ver-color = base06 + "ff"; # Text when verifying
        text-wrong-color = base08 + "ff"; # Text when wrong password
        key-hl-color = base16 + "ff"; # Key press highlight
        bs-hl-color = base08 + "ff"; # Backspace highlight
        separator-color = "00000000"; # Separator between states
        layout-text-color = base16 + "ff"; # Keyboard layout text
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
