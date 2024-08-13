{ config, pkgs, ... }:

let
  theme_tokyonight = pkgs.fetchFromGitHub {
    owner = "folke";
    repo = "tokyonight.nvim";
    rev = "9bf9ec53d5e87b025e2404069b71e7ebdc3a13e5";
    hash = "sha256-ItCmSUMMTe8iQeneIJLuWedVXsNgm+FXNtdrrdJ/1oE=";
  };
in {
  programs.alacritty = {
    enable = true;
    settings = {
      import = [ "${theme_tokyonight}/extras/alacritty/tokyonight_night.toml" ];
      font = {
        normal = {
          family = "Fira Code Nerdfont";
          style = "Regular";
        };
      };
    };
  };
}
