{ pkgs, ... }:

{
  wayland.windowManager.sway.enable = true;
  xdg.configFile."sway/config".enable = false;

  home.file.".config/sway/config".text = ''
    ### Variables
    set $font pango:FiraCodeNerdFont 10.000000

    set $mod Mod4

    ### Font
    font $font

    ###Gaps
    gaps inner 6
    gaps outer 2
    default_border normal 2

    floating_modifier $mod
    default_floating_border normal 2
    hide_edge_borders none
    focus_wrapping no
    focus_follows_mouse yes
    focus_on_window_activation smart
    mouse_warping output
    workspace_layout default
    workspace_auto_back_and_forth no

    ### COLORS
    client.focused #4c7899 #285577 #ffffff #2e9ef4 #285577
    client.focused_inactive #333333 #5f676a #ffffff #484e50 #5f676a
    client.unfocused #333333 #222222 #888888 #292d2e #222222
    client.urgent #2f343a #900000 #ffffff #900000 #900000
    client.placeholder #000000 #0c0c0c #ffffff #000000 #0c0c0c
    client.background #ffffff

    bindsym $mod+0 workspace number 10
    bindsym $mod+1 workspace number 1
    bindsym $mod+2 workspace number 2
    bindsym $mod+3 workspace number 3
    bindsym $mod+4 workspace number 4
    bindsym $mod+5 workspace number 5
    bindsym $mod+6 workspace number 6
    bindsym $mod+7 workspace number 7
    bindsym $mod+8 workspace number 8
    bindsym $mod+9 workspace number 9
    bindsym $mod+Down focus down
    bindsym $mod+Left focus left
    bindsym $mod+Return exec alacritty
    bindsym $mod+Right focus right
    bindsym $mod+Shift+0 move container to workspace number 10
    bindsym $mod+Shift+1 move container to workspace number 1
    bindsym $mod+Shift+2 move container to workspace number 2
    bindsym $mod+Shift+3 move container to workspace number 3
    bindsym $mod+Shift+4 move container to workspace number 4
    bindsym $mod+Shift+5 move container to workspace number 5
    bindsym $mod+Shift+6 move container to workspace number 6
    bindsym $mod+Shift+7 move container to workspace number 7
    bindsym $mod+Shift+8 move container to workspace number 8
    bindsym $mod+Shift+9 move container to workspace number 9
    bindsym $mod+Shift+Down move down
    bindsym $mod+Shift+Left move left
    bindsym $mod+Shift+Right move right
    bindsym $mod+Shift+Up move up
    bindsym $mod+Shift+q reload
    bindsym $mod+Shift+e exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'
    bindsym $mod+Shift+h move left
    bindsym $mod+Shift+j move down
    bindsym $mod+Shift+k move up
    bindsym $mod+Shift+l move right
    bindsym $mod+Shift+minus move scratchpad
    bindsym $mod+q kill
    bindsym $mod+Shift+space floating toggle
    bindsym $mod+Up focus up
    bindsym $mod+a focus parent
    bindsym $mod+b splith
    bindsym $mod+r exec ${pkgs.dmenu}/bin/dmenu_path | ${pkgs.dmenu}/bin/dmenu | ${pkgs.findutils}/bin/xargs swaymsg exec --
    bindsym $mod+e layout toggle split
    bindsym $mod+f fullscreen toggle
    bindsym $mod+h focus left
    bindsym $mod+j focus down
    bindsym $mod+k focus up
    bindsym $mod+l focus right
    bindsym $mod+minus scratchpad show
    bindsym $mod+Shift+r mode resize
    bindsym $mod+s layout stacking
    bindsym $mod+space focus mode_toggle
    bindsym $mod+v splitv
    bindsym $mod+w layout tabbed

    mode "resize" {
      bindsym Down resize grow height 10 px
      bindsym Escape mode default
      bindsym Left resize shrink width 10 px
      bindsym Return mode default
      bindsym Right resize grow width 10 px
      bindsym Up resize shrink height 10 px
      bindsym h resize shrink width 10 px
      bindsym j resize grow height 10 px
      bindsym k resize shrink height 10 px
      bindsym l resize grow width 10 px
    }

    bar {
      swaybar_command ${pkgs.waybar}/bin/waybar
      }
    }

    exec "${pkgs.dbus}/bin/dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP XDG_SESSION_TYPE NIXOS_OZONE_WL XCURSOR_THEME XCURSOR_SIZE; systemctl --user reset-failed && systemctl --user start sway-session.target && swaymsg -mt subscribe '[]' || true && systemctl --user stop sway-session.target"

  '';
}
