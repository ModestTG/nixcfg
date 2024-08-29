{ pkgs, userlib, ... }:

{
  home.packages = with pkgs; [ neovim nixfmt-rfc-style rustc cargo ];

  xdg.configFile."nvim" = {
    source =
      userlib.relativeToRoot "home/eweishaar/common/optional/neovim/config";
    recursive = true;
  };
}
