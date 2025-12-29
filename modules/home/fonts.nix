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
      font-awesome
      fira-code-symbols
    ];
  };
}
