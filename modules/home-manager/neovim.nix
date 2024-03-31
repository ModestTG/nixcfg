{ config, pkgs, ... }:

{
  home.file.".config/nvim" = {
    source = builtins.fetchGit {
      url = "https://github.com/ModestTG/kickstart";
      rev = "";
    recursive = true;
  };
}
