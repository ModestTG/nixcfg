{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "monitor" = ",highrr,auto,1";
      "exec-once" = "waybar";
      "env" = "XCURSOR_SIZE,24";
      input = {
        "kb_layout" = "us";
        "follow_mouse" = "1";
        touchpad = {
            "natural_scroll" = "false";
        };
        "sensitivity" = "0"; 
      };

      general = {
        "gaps_in" = "5";
        "gaps_out" = "20";
        "border_size" = "1";
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        "layout" = "dwindle";
        "allow_tearing" = "false";
      };

      decoration = {
        "rounding" = "0";
        blur = {
          "enabled" = "true";
          "size" = "3";
          "passes" = "1";
          "vibrancy" = "0.1696";
        };
        "drop_shadow" = "true";
        "shadow_range" = "4";
        "shadow_render_power" = "3";
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        "enabled" = "true";
      };
     
      dwindle = {
        "pseudotile" = "true";
        "preserve_split" = "true";
      };

      master = {
        "new_is_master" = "true";
      };

      gestures = {
        "workspace_swipe" = "false";
      };

      misc = {
        "force_default_wallpaper" = "0";
      };

      bind = [
        "$mod, Return, exec, alacritty"
	"$mod, 1, workspace, 1"
	"$mod, 2, workspace, 2"
	"$mod, 3, workspace, 3"
	"$mod, 4, workspace, 4"
	"$mod, 5, workspace, 5"
	"$mod SHIFT, 1, movetoworkspace, 1"
	"$mod SHIFT, 2, movetoworkspace, 2"
	"$mod SHIFT, 3, movetoworkspace, 3"
	"$mod SHIFT, 4, movetoworkspace, 4"
	"$mod SHIFT, 5, movetoworkspace, 5"
	"$mod, b, exec, brave"
	"$mod, q, killactive"
      ];
    };
  };
}
