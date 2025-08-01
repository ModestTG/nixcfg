{ config, ... }:

{
  programs.wlogout = {
    enable = true;
    # style =
    #   with config.scheme.withHashtag;
    #   let
    #     inherit
    #       base00
    #       base01
    #       base02
    #       base03
    #       base04
    #       base05
    #       base06
    #       base07
    #       base08
    #       base09
    #       base0A
    #       base0B
    #       base0C
    #       base0D
    #       base0E
    #       base0F
    #       ;
    #   in
    #   ''
    #     @define-color base00 ${base00}; @define-color base01 ${base01}; @define-color base02 ${base02}; @define-color base03 ${base03};
    #     @define-color base04 ${base04}; @define-color base05 ${base05}; @define-color base06 ${base06}; @define-color base07 ${base07};
    #     @define-color base08 ${base08}; @define-color base09 ${base09}; @define-color base0A ${base0A}; @define-color base0B ${base0B};
    #     @define-color base0C ${base0C}; @define-color base0D ${base0D}; @define-color base0E ${base0E}; @define-color base0F ${base0F};
    #
    #     * {
    #         font-family: "FiraCode Nerd Font Propo Med", FontAwesome;
    #         background-image: none;
    #         transition: 20ms;
    #     }
    #
    #     window {
    #       background-color: rgba(26, 27, 38, 0.1);
    #     }
    #
    #     button {
    #       color: @base05;
    #       font-size: 20px;
    #       background-repeat: no-repeat;
    #       background-position: center;
    #       background-size: 25%
    #       background-color: rgba(26, 27, 38, 0.3);
    #       border-style: solid
    #       border: 3px solid @base05
    #     }
    #
    #     button:focus,
    #     button:active,
    #     button:hover {
    #       color: @base0E;
    #       background-color: rgba(26, 27, 38, 0.5);
    #       border: 3px solid @base0E;
    #     }
    #
    #     #lock,
    #     #logout,
    #     #suspend,
    #     #hibernate,
    #     #shutdown,
    #     #reboot {
    #       margin: 10px;
    #       border-radius: 20px;
    #   '';
  };
}
