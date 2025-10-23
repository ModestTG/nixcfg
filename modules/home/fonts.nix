{
  osConfig,
  lib,
  pkgs-stable,
  ...
}:

let
  cfg = osConfig.ewhsModule.desktop.nerdFonts;
in
{
  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs-stable; [
      noto-fonts
      font-awesome
      nerd-fonts.fira-code
      fira-code-symbols
    ];
  };
}
