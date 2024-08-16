{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      defaultWorkspace = "workspace number 1";
      workspaceLayout = "default";
      workspaceAutoBackAndForth = false;
      fonts = {
        names = [ "FiraCodeNerdFont" ];
        style = "Medium";
        size = 10.0;
      };
      gaps = {
        inner = 6;
        outer = 2;
      };
      window = {
        border = 2;
        titlebar = false;
        hideEdgeBorders = "none";
      };
      floating = {
        modifier = config.wayland.windowManager.sway.config.modifier;
        border = config.wayland.windowManager.sway.config.window.border;
        titlebar = config.wayland.windowManager.sway.config.window.titlebar;
      };
      focus = {
        wrapping = "no";
        followMouse = "yes";
        newWindow = "smart";
        mouseWarping = "output";
      };
      colors = {
        background = "#ffffff";
        placeholder = {
          border = "#000000";
          background = "#0c0c0c";
          text = "#ffffff";
          indicator = "#000000";
          childBorder = "#ffffff";
        };
        urgent = {
          border = "#2f343a";
          background = "#900000";
          text = "#ffffff";
          indicator = "#900000";
          childBorder = "#900000";
        };
        unfocused = {
          border = "#333333";
          background = "#222222";
          text = "#888888";
          indicator = "#292d2e";
          childBorder = "#222222";
        };
        focusedInactive = {
          border = "#333333";
          background = "#5f676a";
          text = "#ffffff";
          indicator = "#484e50";
          childBorder = "#5f676a";
        };
        focused = {
          border = "#4c7899";
          background = "#285577";
          text = "#ffffff";
          indicator = "#2e9ef4";
          childBorder = "#285577";
        };
      };

      keybindings = let mod = config.wayland.windowManager.sway.config.modifier;
      in lib.mkOptionDefault {
        # "${mod}+0" = "workspace number 10";
        # "${mod}+1" = "workspace number 1";
        # "${mod}+2" = "workspace number 2";
        # "${mod}+3" = "workspace number 3";
        # "${mod}+4" = "workspace number 4";
        # "${mod}+5" = "workspace number 5";
        # "${mod}+6" = "workspace number 6";
        # "${mod}+7" = "workspace number 7";
        # "${mod}+8" = "workspace number 8";
        # "${mod}+9" = "workspace number 9";
        # "${mod}+Down" = "focus down";
        # "${mod}+Left" = "focus left";
        "${mod}+Return" = "exec alacritty";
        # "${mod}+Right" = "focus right";
        # "${mod}+Shift+0" = "move container to workspace number 10";
        # "${mod}+Shift+1" = "move container to workspace number 1";
        # "${mod}+Shift+2" = "move container to workspace number 2";
        # "${mod}+Shift+3" = "move container to workspace number 3";
        # "${mod}+Shift+4" = "move container to workspace number 4";
        # "${mod}+Shift+5" = "move container to workspace number 5";
        # "${mod}+Shift+6" = "move container to workspace number 6";
        # "${mod}+Shift+7" = "move container to workspace number 7";
        # "${mod}+Shift+8" = "move container to workspace number 8";
        # "${mod}+Shift+9" = "move container to workspace number 9";
        # "${mod}+Shift+Down" = "move down";
        # "${mod}+Shift+Left" = "move left";
        # "${mod}+Shift+Right" = "move right";
        # "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+q" = "reload";
        # "${mod}+Shift+e" =
        #   "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
        # "${mod}+Shift+h" = "move left";
        # "${mod}+Shift+j" = "move down";
        # "${mod}+Shift+k" = "move up";
        # "${mod}+Shift+l" = "move right";
        # "${mod}+Shift+minus" = "move scratchpad";
        "${mod}+q" = "kill";
        # "${mod}+Shift+space" = "floating toggle";
        # "${mod}+Up" = "focus up";
        # "${mod}+a" = "focus parent";
        "${mod}+b" = "exec brave";
        "${mod}+d" = "nop";
        "${mod}+r" = "exec wofi --show drun";
        # "${mod}+e" = "layout toggle split";
        # "${mod}+f" = "fullscreen toggle";
        # "${mod}+h" = "focus left";
        # "${mod}+j" = "focus down";
        # "${mod}+k" = "focus up";
        # "${mod}+l" = "focus right";
        # "${mod}+minus" = "scratchpad show";
        # "${mod}+Shift+r" = "mode resize";
        # "${mod}+s" = "layout stacking";
        # "${mod}+space" = "focus mode_toggle";
        # "${mod}+v" = "splitv";
        # "${mod}+w" = "layout tabbed";
        "${mod}+Shift+s" = ''exec grim -g "$(slurp)" - | swappy -f -'';
      };
      bars = [{
        command = "${pkgs.waybar}/bin/waybar";
        fonts = config.wayland.windowManager.sway.config.fonts;
      }];
      assigns = {
        "2" = [{ class = "Brave"; }];
        "3" = [{ class = "^Spotify$"; }];
        "4" = [{ class = "^discord$"; }];
      };
    };
  };
}
