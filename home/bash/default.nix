{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -alh";
      vim = "nvim";
      cat = "bat";
      sudo = "doas";
    };
  };
}
