{
  osConfig,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  cfg = osConfig.ewhsModule.pkgs.git;
in
{
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings = {
        user.name = "ModestTG";
        user.email = "ssh@mailserver.com";
        init.defaultBranch = "main";
        safe.directory = "/home/eweishaar/nixcfg";
      };
    };
    programs.lazygit.enable = true;
  };
}
