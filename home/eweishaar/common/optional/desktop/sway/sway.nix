{
  config,
  pkgs,
  lib,
  ...
}:

{
  wayland.windowManager.sway =
    let
      modifier = "Mod4";
      border = 2;
      titlebar = false;
      fontName = "FiraCodeNerdFont";
    in
    {
      enable = true;
      config = {
        inherit modifier;
        defaultWorkspace = "workspace number 1";
        workspaceLayout = "default";
        workspaceAutoBackAndForth = false;
        fonts = {
          names = [ fontName ];
          style = "Medium";
          size = 10.0;
        };
        gaps = {
          inner = 6;
          outer = 2;
        };
        window = {
          inherit border titlebar;
          hideEdgeBorders = "none";
        };
        floating = {
          inherit modifier border titlebar;
          criteria = [
            {
              app_id = "org.pulseaudio.pavucontrol";
            }
          ];
        };
        focus = {
          wrapping = "no";
          followMouse = "yes";
          newWindow = "smart";
          mouseWarping = "output";
        };

        colors =
          with config.scheme.withHashtag;
          let
            text = base05;
            urgent = base08;
            focused = base0D;
            unfocused = base03;
            background = base00;
            indicator = base0B;
          in
          {
            inherit background;
            urgent = {
              inherit background indicator text;
              border = urgent;
              childBorder = urgent;
            };
            focused = {
              inherit background indicator text;
              border = focused;
              childBorder = focused;
            };
            focusedInactive = {
              inherit background indicator text;
              border = unfocused;
              childBorder = unfocused;
            };
            unfocused = {
              inherit background indicator text;
              border = unfocused;
              childBorder = unfocused;
            };
            placeholder = {
              inherit background indicator text;
              border = unfocused;
              childBorder = unfocused;
            };
          };
        keybindings = lib.mkOptionDefault {
          # "${modifier}+0" = "workspace number 10";
          # "${modifier}+1" = "workspace number 1";
          # "${modifier}+2" = "workspace number 2";
          # "${modifier}+3" = "workspace number 3";
          # "${modifier}+4" = "workspace number 4";
          # "${modifier}+5" = "workspace number 5";
          # "${modifier}+6" = "workspace number 6";
          # "${modifier}+7" = "workspace number 7";
          # "${modifier}+8" = "workspace number 8";
          # "${modifier}+9" = "workspace number 9";
          # "${modifier}+Down" = "focus down";
          # "${modifier}+Left" = "focus left";
          "${modifier}+Return" = "exec alacritty";
          # "${modifier}+Right" = "focus right";
          # "${modifier}+Shift+0" = "move container to workspace number 10";
          # "${modifier}+Shift+1" = "move container to workspace number 1";
          # "${modifier}+Shift+2" = "move container to workspace number 2";
          # "${modifier}+Shift+3" = "move container to workspace number 3";
          # "${modifier}+Shift+4" = "move container to workspace number 4";
          # "${modifier}+Shift+5" = "move container to workspace number 5";
          # "${modifier}+Shift+6" = "move container to workspace number 6";
          # "${modifier}+Shift+7" = "move container to workspace number 7";
          # "${modifier}+Shift+8" = "move container to workspace number 8";
          # "${modifier}+Shift+9" = "move container to workspace number 9";
          # "${modifier}+Shift+Down" = "move down";
          # "${modifier}+Shift+Left" = "move left";
          # "${modifier}+Shift+Right" = "move right";
          # "${modifier}+Shift+Up" = "move up";
          "${modifier}+Shift+q" = "reload";
          # "${modifier}+Shift+e" =
          #   "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
          # "${modifier}+Shift+h" = "move left";
          # "${modifier}+Shift+j" = "move down";
          # "${modifier}+Shift+k" = "move up";
          # "${modifier}+Shift+l" = "move right";
          # "${modifier}+Shift+minus" = "move scratchpad";
          "${modifier}+q" = "kill";
          # "${modifier}+Shift+space" = "floating toggle";
          # "${modifier}+Up" = "focus up";
          # "${modifier}+a" = "focus parent";
          "${modifier}+b" = "exec brave";
          "${modifier}+d" = "nop";
          "${modifier}+r" = "exec wofi --show run";
          # "${modifier}+e" = "layout toggle split";
          # "${modifier}+f" = "fullscreen toggle";
          # "${modifier}+h" = "focus left";
          # "${modifier}+j" = "focus down";
          # "${modifier}+k" = "focus up";
          # "${modifier}+l" = "focus right";
          # "${modifier}+minus" = "scratchpad show";
          # "${modifier}+Shift+r" = "mode resize";
          # "${modifier}+s" = "layout stacking";
          # "${modifier}+space" = "focus mode_toggle";
          # "${modifier}+v" = "splitv";
          # "${modifier}+w" = "layout tabbed";
          "${modifier}+Shift+s" = ''exec grim -g "$(slurp)" - | swappy -f -'';
        };
        bars = [
          {
            command = "${pkgs.waybar}/bin/waybar";
            fonts = config.wayland.windowManager.sway.config.fonts;
          }
        ];
        assigns = {
          "2" = [ { class = "Brave"; } ];
          "3" = [ { class = "^Spotify$"; } ];
          "4" = [ { class = "^discord$"; } ];
        };
        startup = [
          {
            command = "autotiling";
            always = true;
          }
        ];
      };
    };
}
