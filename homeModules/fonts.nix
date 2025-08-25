{
  config,
  lib,
  pkgs-stable,
  ...
}:

let
  cfg = config.homeModule.desktop.nerdFonts;
in
{
  options.homeModule.desktop.nerdFonts = {
    enable = lib.mkEnableOption "Enable Nerdfonts";
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs-stable; [
      noto-fonts
      font-awesome
      fira-code-nerdfont
      fira-code-symbols
    ];
  };
}
