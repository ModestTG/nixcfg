{ pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [ noto-fonts nerdfonts meslo-lgs-nf ];
}
