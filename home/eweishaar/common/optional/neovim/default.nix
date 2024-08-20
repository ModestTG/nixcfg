{ pkgs, userlib, ... }:

{
  home.packages = with pkgs; [ neovim nixfmt rustc cargo ];

  xdg.configFile."nvim" = {
    source =
      userlib.relativeToRoot "home/eweishaar/common/optional/neovim/config";
    recursive = true;
  };
}
