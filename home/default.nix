{config, pkgs, ...}:

{
  imports = [
    ./bash
    ./ssh
    ./alacritty
    ./sway
  ];

  home = {
    username = "eweishaar";
    homeDirectory = "/home/eweishaar";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
