{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    noto-fonts
    font-awesome
    fira-code-nerdfont
    fira-code-symbols
  ];
}
