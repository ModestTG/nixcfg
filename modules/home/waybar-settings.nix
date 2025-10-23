{
  osConfig,
  lib,
  pkgs,
  ...
}:

let
  cfg = osConfig.ewhsModule.desktop;
  waybar-experimental = pkgs.waybar.overrideAttrs (oldAttrs: {
    mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
  });
in
{
  config = lib.mkIf (cfg.bar == "waybar") {
    programs.waybar = {
      enable = true;
      package = waybar-experimental;
      settings = {
        mainBar = {
          position = "top"; # Waybar position (top|bottom|left|right)
          # height = 30; # Waybar height (to be removed for auto height)
          # "width" =  1280, # Waybar width
          spacing = 4; # Gaps between modules (4px)
          modules-left = [
            "custom/space"
            "custom/media"
          ];
          modules-center = [
            "sway/workspaces"
          ];
          modules-right = [
            "pulseaudio"
            "tray"
            "clock"
            "idle_inhibitor"
            "custom/power"
            "custom/space"
          ];
          # Modules configuration
          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            warp-on-scroll = false;
            format = "{icon}";
            format-icons = {
              "1" = "";
              "2" = "󰖟";
              "3" = "";
              "4" = "";
              "5" = "󰊗";
              # urgent = "";
              # focused = "";
              # default = "";
            };
            persistent-workspaces = {
              "1" = [ ];
              "2" = [ ];
              "3" = [ ];
              "4" = [ ];
              "5" = [ ];
            };
          };
          tray = {
            icon-size = 18;
            spacing = 10;
          };
          clock = {
            interval = 1;
            format = "{:%R}";
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            calendar = {
              mode = "year";
              mode-mon-col = 3;
              weeks-pos = "right";
              on-scroll = 1;
            };
          };
          pulseaudio = {
            # scroll-step =  1, # %, can be a float;
            format = "{volume}% {icon}  {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = "";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [
                ""
                ""
                ""
              ];
            };
            on-click = "pavucontrol";
          };
          "custom/space" = {
            format = "";
            tooltip = false;
          };
          "custom/media" = {
            format = "{}";
            max-length = 40;
            format-icons = {
              spotify = "";
              default = "🎜";
            };
            escape = true;
            exec = ''playerctl -p spotify metadata -f "{{artist}} - {{title}}" -F'';
          };
          "custom/power" = {
            format = "";
            tooltip = false;
            on-click = "wlogout -p layer-shell";
          };
          idle_inhibitor = {
            format = "{icon}";
            format-icons = {
              activated = "󱙲";
              deactivated = "󰍁";
            };
          };
        };
      };
    };
  };
}
