{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, Return, exec, alacritty"
      ] ++ (
        builtins.concatLists (builtins.genList (
	  x: let
	    ws = let
	      c = (x+1) / 10;
            in
	      builtins.toString (x+1-(c*10));
	  in [
	    "$mod, ${ws}, workspace, ${toString (x+1)}"
	    "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x+1)}"
	  ]
	)
	10)
      );
    };
  };
}
