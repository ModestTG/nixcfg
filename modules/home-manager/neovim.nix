{ config, pkgs, ... }:

{
  home.file.".config/nvim" = {
    source = builtins.fetchGit {
      url = "https://github.com/ModestTG/kickstart";
      rev = "38ff50d394b050b63bef02d9357ac352aafc42f8";
    };
    recursive = true;
  };
}
