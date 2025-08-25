{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  cfg = config.homeModule.pkgs.git;
in
{
  options.homeModule.pkgs.git = {
    enable = lib.mkEnableOption "Enable Git";
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      package = pkgs.gitAndTools.gitFull;
      userName = "ModestTG";
      userEmail = "ssh@mailserver.com";
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "/home/eweishaar/nixcfg";
      };
    };
    home.packages = with pkgs; [ lazygit ];
    xdg.configFile."lazygit/config.yml".source =
      "${inputs.theme_tokyonight}/extras/lazygit/tokyonight_night.yml";
  };
}
