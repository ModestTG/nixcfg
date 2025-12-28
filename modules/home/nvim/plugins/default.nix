{ pkgs, userlib, ... }:

{
  imports = userlib.scanPaths ./.;
  programs.nixvim = {
    plugins = {
      luasnip.enable = true;
      sleuth.enable = true;
      tmux-navigator.enable = true;
      web-devicons.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      nvim-sops # sops file encryption/decryption
    ];
  };
}
