{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    nixosModule.gaming.steam.enable = lib.mkEnableOption "enable Steam";
  };

  config = lib.mkIf config.nixosModule.gaming.steam.enable {
    programs.steam = {
      enable = true;
      extraPackages = with pkgs; [
        gamescope
        gamemode
        mangohud
      ];
    };
    hardware.xone.enable = true;

  };
}
