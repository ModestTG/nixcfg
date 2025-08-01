{
  config,
  lib,
  pkgs-stable,
  ...
}:
{
  options = {
    homeModule.desktop.fonts.enable = lib.mkEnableOption "Enable Nerdfonts";
  };

  config = lib.mkIf config.homeModule.desktop.enable {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs-stable; [
      noto-fonts
      font-awesome
      fira-code-nerdfont
      fira-code-symbols
    ];
  };
}
