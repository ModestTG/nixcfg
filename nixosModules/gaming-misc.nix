{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    nixosModule.gaming.misc.enable = lib.mkEnableOption "enables miscellaneous gaming features";
  };

  config = lib.mkIf config.nixosModule.gaming.misc.enable {
    environment.systemPackages = with pkgs; [
      prismlauncher
      r2modman
      xmage
    ];
  };
}
