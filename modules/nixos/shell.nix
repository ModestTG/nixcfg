{ config, lib, ... }:
let
  cfg = config.ewhsModule;
in
{
  programs.bash = lib.mkIf (cfg.shell == "bash") {
    enable = true;
  };
}
