{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        # "layer" =  "top", # Waybar at top layer
        position = "top"; # Waybar position (top|bottom|left|right)
        height = 30; # Waybar height (to be removed for auto height)
        # "width" =  1280, # Waybar width
        spacing = 4; # Gaps between modules (4px)
        # Choose the order of the modules
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
            urgent = "";
            focused = "";
            default = "";
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
          # "icon-size" =  21
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
          format = "{volume}% {icon} {format_source}";
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
          format = " ";
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
          format = "⏻";
          tooltip = false;
          menu = "on-click";
          menu-file = pkgs.writeText "power_menu.xml" ''
            <?xml version="1.0" encoding="UTF-8"?>
            <interface>
              <object class="GtkMenu" id="menu">
                <child>
            		<object class="GtkMenuItem" id="suspend">
            			<property name="label">Suspend</property>
                    </object>
            	</child>
            	<child>
                    <object class="GtkMenuItem" id="hibernate">
            			<property name="label">Hibernate</property>
                    </object>
            	</child>
                <child>
                    <object class="GtkMenuItem" id="shutdown">
            			<property name="label">Shutdown</property>
                    </object>
                </child>
                <child>
                  <object class="GtkSeparatorMenuItem" id="delimiter1"/>
                </child>
                <child>
            		<object class="GtkMenuItem" id="reboot">
            			<property name="label">Reboot</property>
            		</object>
                </child>
              </object>
            </interface>
          ''; # Menu file in resources folder;
          menu-actions = {
            shutdown = "shutdown";
            reboot = "reboot";
            suspend = "systemctl suspend";
            hibernate = "systemctl hibernate";
          };
        };
      };
    };
  };
  # Needed for some features
  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];
}
