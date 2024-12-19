{ pkgs, inputs, ... }:

{
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
}
