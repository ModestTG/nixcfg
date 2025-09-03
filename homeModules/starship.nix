{
  config,
  lib,
  pkgs-stable,
  ...
}:

with config.scheme.withHashtag;
let
  cfg = config.homeModule;
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
  options.homeModule.pkgs.starship = {
    enable = lib.mkEnableOption "Enable starship";
  };

  config = lib.mkIf cfg.pkgs.starship.enable {
    programs.starship = {
      enable = true;
      package = pkgs-stable.starship;
      settings = {
        format = ''
          [░▒▓](${base06})[ 󱄅 ](bg:${base06} fg:${base00})[](bg:${base0D} fg:${base06})$directory[](fg:${base0D} bg:${base03})$git_branch$git_status[](fg:${base03} bg:${base02})$nodejs$rust$golang$php[](fg:${base02}) $nix_shell $time
          $character'';
        directory = {
          style = "fg:${base07} bg:${base0D}";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
        };
        git_branch = {
          symbol = "";
          style = "bg:${base03}";
          format = ''[[ $symbol $branch ](fg:${base0E} bg:${base03})]($style)'';
        };
        git_status = {
          style = "bg:${base03}";
          format = ''[[($all_status$ahead_behind )](fg:${base0E} bg:${base03})]($style)'';
        };
        nodejs = {
          symbol = "";
          style = "bg:${base02}";
          format = ''[[ $symbol ($version) ](fg:${base0E} bg:#${base02})]($style)'';
        };
        rust = {
          symbol = "";
          style = "bg:${base02}";
          format = ''[[ $symbol ($version) ](fg:${base0E} bg:#${base02})]($style)'';
        };
        golang = {
          symbol = "";
          style = "bg:${base02}";
          format = ''[[ $symbol ($version) ](fg:${base0E} bg:#${base02})]($style)'';
        };
        php = {
          symbol = "";
          style = "bg:${base02}";
          format = ''[[ $symbol ($version) ](fg:${base0E} bg:#${base02})]($style)'';
        };
        time = {
          disabled = false;
          time_format = "%R"; # Hour:Minute Format;
          format = ''[[  $time ](fg:${base07})]($style)'';
        };
        nix_shell = {
          style = "fg:${base0C}";
          format = ''via [$state( \($name\))]($style)'';
        };
      };
    };
  };
}
