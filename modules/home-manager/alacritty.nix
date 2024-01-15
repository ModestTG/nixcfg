{ config, pkgs, ... }:

{
  programs.alacritty.settings = {
    enable = true;
    font = {
      normal = {
        family = "Fira Code Nerdfont";
	style = "Regular";
      };
    };
  };
}
