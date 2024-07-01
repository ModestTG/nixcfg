{config, pkgs, userSettings, ...}:

{
  imports = [
    ./bash
    ./ssh
    ./alacritty
    ./sway
  ];

  home = rec {
    username = "${userSettings.username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
