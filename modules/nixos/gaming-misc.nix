{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.ewhsModule.gaming.misc;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      prismlauncher
      r2modman
      xmage
      (inputs.hytale-launcher.packages.${pkgs.stdenv.hostPlatform.system}.hytale-launcher)
    ];
  };
}
