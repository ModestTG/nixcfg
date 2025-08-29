{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.nixosModule.gaming.steam;
in
{
  options.nixosModule.gaming.steam = {
    enable = lib.mkEnableOption "enable Steam";
  };

  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      extraPackages = with pkgs; [
        gamescope
        gamemode
        mangohud
      ];
    };
  };
}
