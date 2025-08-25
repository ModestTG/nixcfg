{ config, lib, ... }:

with config.scheme.withHashtag;
let
  cfg = config.homeModule.desktop;
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
{
  config = lib.mkIf (cfg.launcher == "wofi") {
    programs.wofi = {
      enable = true;
      settings = {
        mode = "run";
        allow_images = true;
        width = "35%";
        key_expand = "space";
        key_down = "Ctrl-j";
        key_up = "Ctrl-k";
        key_right = "Ctrl-l";
        key_left = "Ctrl-h";
      };
      style = # css
        ''
          @define-color base00 ${base00}; @define-color base01 ${base01}; @define-color base02 ${base02}; @define-color base03 ${base03};
          @define-color base04 ${base04}; @define-color base05 ${base05}; @define-color base06 ${base06}; @define-color base07 ${base07};
          @define-color base08 ${base08}; @define-color base09 ${base09}; @define-color base0A ${base0A}; @define-color base0B ${base0B};
          @define-color base0C ${base0C}; @define-color base0D ${base0D}; @define-color base0E ${base0E}; @define-color base0F ${base0F};

          window {
              font-family: "FiraCode Nerd Font Propo";
              font-size: 24px;
              background-color: @base00;
              color: @base07;
              border-bottom: 3px solid @base01;
          }

          #entry {
              padding: 0.25em;
          }

          #entry:selected {
              background-color: @base0E;
              color: @base00;
              background: linear-gradient(90deg, @base0E, @base0D);
          }

          #input {
              background-color: @base01;
              color: @base07;
              padding: 0.25em;
          }

          image {
              margin-left: 0.25em;
              margin-right: 0.25em;
          }
        '';
    };
  };
}
