{ config, ... }:

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
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      format = ''
        [░▒▓](${base06})[ 󱄅 ](bg:${base06} fg:${base00})[](bg:${base0E} fg:${base06})$directory[](fg:${base0E} bg:${base03})$git_branch$git_status[](fg:${base03} bg:${base02})$nodejs$rust$golang$php[](fg:${base02} bg:${base01})$time[  ](fg:${base01})
        $character'';
      directory = {
        style = "fg:${base07} bg:${base0E}";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };
      directory.substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
      };
      git_branch = {
        symbol = "";
        style = "bg:#394260";
        format = ''[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)'';
      };
      git_status = {
        style = "bg:#394260";
        format = ''[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)'';
      };
      nodejs = {
        symbol = "";
        style = "bg:#${base0E}";
        format = ''[[ $symbol ($version) ](fg:#769ff0 bg:#${base0E})]($style)'';
      };
      rust = {
        symbol = "";
        style = "bg:#${base0E}";
        format = ''[[ $symbol ($version) ](fg:#769ff0 bg:#${base0E})]($style)'';
      };
      golang = {
        symbol = "";
        style = "bg:#${base0E}";
        format = ''[[ $symbol ($version) ](fg:#769ff0 bg:#${base0E})]($style)'';
      };
      php = {
        symbol = "";
        style = "bg:#${base0E}";
        format = ''[[ $symbol ($version) ](fg:#769ff0 bg:#${base0E})]($style)'';
      };
      time = {
        disabled = false;
        time_format = "%R"; # Hour:Minute Format;
        style = "bg:#1d2230";
        format = ''[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)'';
      };
    };
  };
}
