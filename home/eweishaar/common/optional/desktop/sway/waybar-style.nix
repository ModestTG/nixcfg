{ config, ... }:

{
  programs.waybar.style =
    with config.scheme.withHashtag;
    let
      inherit
        base00
        base01
        base02
        base03
        base04
        base05
        base06
        base07
        base08
        base09
        base0A
        base0B
        base0C
        base0D
        base0E
        base0F
        ;
    in
    # css
    ''
      @define-color base00 ${base00}; @define-color base01 ${base01}; @define-color base02 ${base02}; @define-color base03 ${base03};
      @define-color base04 ${base04}; @define-color base05 ${base05}; @define-color base06 ${base06}; @define-color base07 ${base07};
      @define-color base08 ${base08}; @define-color base09 ${base09}; @define-color base0A ${base0A}; @define-color base0B ${base0B};
      @define-color base0C ${base0C}; @define-color base0D ${base0D}; @define-color base0E ${base0E}; @define-color base0F ${base0F};
      * {
          /* `otf-font-awesome` is required to be installed for icons */
          font-family: "FiraCode Nerd Font Propo Med", FontAwesome;
          border: none;
          border-radius: 0px;
      }

      /* WINDOW */

      window#waybar {
        background-color: transparent;
      }

      /* WORKSPACES */

      #workspaces button {
        font-size: 18px;
        padding: 0;
        margin: 4px;
        padding: 4px;
        border: none;
        color: @base0E;
        background-color: transparent;
        transition: all 0.2s ease-in-out;
      }

      #workspaces button.focused {
          color: @base09;
      }

      #workspaces button.urgent {
          color: @base08;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        color: @base0B;
        background-color: transparent;
        background: transparent;
      }

      /* TOOLTIPS */

      tooltip {
          border-radius: 10px;
          background-color: @base01;
          opacity:0.8;
          padding:20px;
          margin:0px;
      }

      tooltip label {
          color: @base0E;
      }

      #clock, #tray, #pulseaudio, #custom-media, #custom-power, #idle_inhibitor {
        background-color: @base00;
        font-size: 18px;
        color: @base0E;
        border-radius: 15px;
        padding: 4px 6px;
        margin: 4px;
        opacity:0.8;
        border: 2px solid @base01;
      }

      #custom-space {
        padding: 0px;
        margin: 0px;
        background-color: transparent;
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #eb4d4b;
      }
    '';
}
