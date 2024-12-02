{ pkgs-stable, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs-stable; [
    noto-fonts
    font-awesome
    fira-code-nerdfont
    fira-code-symbols
  ];
}
