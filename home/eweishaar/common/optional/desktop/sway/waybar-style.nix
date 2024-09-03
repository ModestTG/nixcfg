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
    ''
      @define-color base00 ${base00}; @define-color base01 ${base01}; @define-color base02 ${base02}; @define-color base03 ${base03};
      @define-color base04 ${base04}; @define-color base05 ${base05}; @define-color base06 ${base06}; @define-color base07 ${base07};
      @define-color base08 ${base08}; @define-color base09 ${base09}; @define-color base0A ${base0A}; @define-color base0B ${base0B};
      @define-color base0C ${base0C}; @define-color base0D ${base0D}; @define-color base0E ${base0E}; @define-color base0F ${base0F};
      * {
          /* `otf-font-awesome` is required to be installed for icons */
          font-family: FiraCodeNerdFont-Medium;
          border: none;
          border-radius: 0px;
      }

      window#waybar {
          background-color: rgba(0,0,0,0.8);
          border-bottom: 0px solid #FFFFFF;
          color: @base05;
          background: transparent;
          transition-property: background-color;
          transition-duration: .5s;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      /*
      window#waybar.empty {
          background-color: transparent;
      }
      window#waybar.solo {
          background-color: #FFFFFF;
      }
      */

      window#waybar.termite {
          background-color: #3F3F3F;
      }

      window#waybar.chromium {
          background-color: #000000;
          border: none;
      }

      button {
          /* Use box-shadow instead of border so the text isn't offset */
          box-shadow: inset 0 -3px transparent;
          /* Avoid rounded borders under each button name */
          border: none;
          border-radius: 0;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
          background: inherit;
          box-shadow: inset 0 -3px #ffffff;
      }

      ###WORKSPACES

      #workspaces {
        background: @base00;
        margin: 2px 1px 3px 1px;
        padding: 0px 1px;
        border-radius: 15px;
        border: 0px;
        font-weight: bold;
        font-style: normal;
        opacity: 0.8;
        font-size: 16px;
        color: @base0E;
        margin: 0 4px;
      }

      #workspaces button {
        padding: 0px 5px;
        margin: 4px 3px;
        border-radius: 15px;
        border: 0px;
        color: @base0E;
        background-color: @base00;
        transition: all 0.3s ease-in-out;
        opacity: 0.8;
      }

      #workspaces button:hover {
        border-radius: 15px;
      }

      #workspaces button.focused {
          background-color: @base03;
          box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button.urgent {
          background-color: @base08;
      }

      ### TOOLTIPS

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

      #pulseaudio, #clock, #tray, #custom-media {
        background-color: @base00;
        font-size: 16px;
        color: @base0E;
        border-radius: 15px;
        padding: 1px 10px 0px 10px;
        margin: 3px 15px 3px 0px;
        opacity:0.8;
        border:3px solid @base05;
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
