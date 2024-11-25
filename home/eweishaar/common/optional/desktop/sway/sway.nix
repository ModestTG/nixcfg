{
  config,
  pkgs,
  lib,
  userlib,
  ...
}:

{
  xdg.portal = {
    enable = true;
    configPackages = [ pkgs.xdg-desktop-portal-wlr ];
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  wayland.windowManager.sway =
    let
      modifier = "Mod4";
      border = 2;
      titlebar = false;
      fontName = "FiraCodeNerdFont";
    in
    # schema = pkgs.gsettings-desktop-schemas;
    # datadir = "${schema}/share/gsettings-schemas/${schema.name}";
    {
      enable = true;
      package = pkgs.swayfx;
      wrapperFeatures.gtk = true;
      checkConfig = false;
      # extraSessionCommands = ''XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS'';
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
          top = -6;
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
          "${modifier}+0" = "nop";
          "${modifier}+1" = "workspace number 1";
          "${modifier}+2" = "workspace number 2";
          "${modifier}+3" = "workspace number 3";
          "${modifier}+4" = "workspace number 4";
          "${modifier}+5" = "workspace number 5";
          "${modifier}+6" = "nop";
          "${modifier}+7" = "nop";
          "${modifier}+8" = "nop";
          "${modifier}+9" = "nop";
          # "${modifier}+Down" = "focus down";
          # "${modifier}+Left" = "focus left";
          "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
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
          "${modifier}+b" = "exec ${pkgs.brave}/bin/brave";
          "${modifier}+d" = "nop";
          "${modifier}+r" = "exec ${pkgs.wofi}/bin/wofi";
          "${modifier}+e" = "exec ${pkgs.xfce.thunar}/bin/thunar";
          "${modifier}+c" = "exec ${pkgs.alacritty}/bin/alacritty --title Alacritty-BC -e ${pkgs.bc}/bin/bc -q";
          # "${modifier}+f" = "fullscreen toggle";
          # "${modifier}+h" = "focus left";
          # "${modifier}+j" = "focus down";
          # "${modifier}+k" = "focus up";
          "${modifier}+l" = "exec ${pkgs.swaylock-effects}/bin/swaylock";
          # "${modifier}+minus" = "scratchpad show";
          # "${modifier}+Shift+r" = "mode resize";
          # "${modifier}+s" = "layout stacking";
          # "${modifier}+space" = "focus mode_toggle";
          # "${modifier}+v" = "splitv";
          # "${modifier}+w" = "layout tabbed";
          "${modifier}+Shift+s" = "exec flameshot gui";
          "${modifier}+p" = "exec playerctl -p spotify play-pause";
          "${modifier}+Ctrl+Right" = "exec playerctl -p spotify next";
          "${modifier}+Ctrl+Left" = "exec playerctl -p spotify previous";
        };
        bars = [
          {
            command = "${pkgs.waybar}/bin/waybar";
            fonts = config.wayland.windowManager.sway.config.fonts;
          }
        ];
        assigns = {
          "2" = [ { app_id = "brave-browser"; } ];
          "3" = [ { class = "^Spotify$"; } ];
          "4" = [
            { class = "^discord$"; }
            { class = "^vesktop$"; }
          ];
        };
        startup = [
          {
            command = "${pkgs.autotiling}/bin/autotiling";
            always = true;
          }
          {
            command = "${pkgs.spotify}/bin/spotify";
          }
          {
            command = "${pkgs.vesktop}/bin/vesktop";
          }
        ];
      };
      extraConfig = ''for_window [title="Alacritty-BC"] floating enable, resize set 600 800'';
    };
  systemd.user =
    let
      dir = userlib.relativeToRoot "config/wallpapers/2560x1440";
      rndWallpaper = pkgs.writeShellApplication {
        name = "rndWallpaper";
        runtimeInputs = with pkgs; [
          coreutils
          findutils
          procps
          swww
        ];
        text = # bash
          ''
            swww img "$(find ${dir} | shuf -n 1 | xargs realpath)" --transition-type simple;
          '';
      };
    in
    {
      services.wallpaper-daemon = {
        Unit = {
          Description = "Wallpaper Daemon";
          Requires = [ "swww-daemon.service" ];
        };
        Service = {
          Type = "oneshot";
          ExecStart = ''${rndWallpaper}/bin/rndWallpaper'';
        };
        Install = {
          WantedBy = [ "graphical.target" ];
        };
      };
      timers.wallpaper-daemon = {
        Timer = {
          Unit = "wallpaper-daemon.service";
          OnCalendar = "*:0/10";
          Persistent = true;
        };
        Install = {
          WantedBy = [ "timers.target" ];
        };
      };
      services.swww-daemon = {
        Unit = {
          Description = "SWWW Daemon";
        };
        Service = {
          Type = "simple";
          ExecStart = "${pkgs.swww}/bin/swww-daemon";
        };
        Install = {
          WantedBy = [ "graphical.target" ];
        };
      };
    };
}
