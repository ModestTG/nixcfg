{ pkgs, ... }:
{
  home.packages = with pkgs; [ ghostty ];
  programs.ghostty.settings = {
    font-family = "FiraCode Nerd Font Propo";
    theme = "tokyonight";
    background-opacity = 0.9;
    window-decoration = false;
    gtk-single-instance = true;
    confirm-close-surface = false;
  };
}
