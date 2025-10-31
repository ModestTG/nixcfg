{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.ewhsModule.gaming.steam;
in
{
  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      extraPackages = with pkgs; [
        gamescope
      ];
    };
    programs.gamemode.enable = true;
  };
}
