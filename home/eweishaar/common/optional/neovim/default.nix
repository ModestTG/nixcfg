{ pkgs, userlib, lib, ... }:

let
  initLuaStringInterpolation =
    builtins.replaceStrings [ "cmd = {'nil'}" ] [ "cmd = {${pkgs.nil}}" ]
    (builtins.readFile (userlib.relativeToRoot
      "home/eweishaar/common/optional/neovim/config/init.lua"));
in {
  home.packages = with pkgs; [ neovim nixfmt nil ];

  home.file.".config/nvim/" = {
    source =
      userlib.relativeToRoot "home/eweishaar/common/optional/neovim/config";
    recursive = true;
  };
  home.file.".config/nvim/init.lua".text =
    lib.mkDefault initLuaStringInterpolation;
}
