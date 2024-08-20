{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [ lazygit ];
  xdg.configFile."lazygit.config.yml".source =
    "${inputs.theme_tokyonight}/extras/lazygit/tokyonight_night.yml";
}
