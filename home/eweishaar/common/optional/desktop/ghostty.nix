{ pkgs, ... }:
{
  home.packages = with pkgs; [ ghostty ];
  xdg.configFile."ghostty/config".text = ''
    font-family = "FiraCode Nerd Font Propo"
    theme = tokyonight
    background-opacity = 0.9
    window-decoration = false
    gtk-single-instance = true
    confirm-close-surface = false
  '';
}
