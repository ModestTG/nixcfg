{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      import = [ "${inputs.theme_tokyonight}/extras/alacritty/tokyonight_night.toml" ];
      font = {
        normal = {
          family = "Fira Code Nerdfont";
          style = "Regular";
        };
      };
    };
  };
}
