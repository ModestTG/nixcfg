{
  config,
  lib,
  osConfig,
  ...
}:

let
  cfg = osConfig.ewhsModule.desktop;
in
{
  config = lib.mkIf (cfg.sessionManager == "wlogout") {
    programs.wlogout = {
      enable = true;
    };
  };
}
