{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.nixosModule.gaming.misc;
in
{
  options.nixosModule.gaming.misc = {
    enable = lib.mkEnableOption "enables miscellaneous gaming features";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      prismlauncher
      r2modman
      xmage
    ];
  };
}
