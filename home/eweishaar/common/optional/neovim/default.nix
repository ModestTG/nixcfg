{ pkgs, userlib, lib, ... }:

let
  # initLuaStringInterpolation =
  #   builtins.replaceStrings [ "cmd = {'nil'}" ] [ "cmd = {${pkgs.nil}}" ]
  #   (builtins.readFile (userlib.relativeToRoot
  #     "home/eweishaar/common/optional/neovim/config/init.lua"));
in {
  home.packages = with pkgs; [ neovim nixfmt rustc cargo ];

  home.file.".config/nvim/" = {
    source =
      userlib.relativeToRoot "home/eweishaar/common/optional/neovim/config";
    recursive = true;
  };
}
