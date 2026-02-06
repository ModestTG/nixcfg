{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.ewhsModule.desktop.brother-printer;
in
{
  config = lib.mkIf cfg.enable {
    services.printing = {
      enable = true;
    };
  };
}
