{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "Fira Code Nerdfont";
	  style = "Regular";
        };
      };
    };
  };
}
