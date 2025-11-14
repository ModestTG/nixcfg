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
    home.packages = with pkgs; [ lazygit ];
    xdg.configFile."lazygit/config.yml".source =
      "${inputs.theme_tokyonight}/extras/lazygit/tokyonight_night.yml";
  };
}
