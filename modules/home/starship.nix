{
  lib,
  osConfig,
  pkgs,
  ...
}:

let
  cfg = osConfig.ewhsModule;
in
{
  config = lib.mkIf cfg.pkgs.starship.enable {
    programs.starship = {
      enable = true;
      settings = lib.mkMerge [
        (fromTOML (builtins.readFile "${pkgs.starship}/share/starship/presets/nerd-font-symbols.toml"))
      ];
    };
  };
}
