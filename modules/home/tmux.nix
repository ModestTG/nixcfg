{
  osConfig,
  lib,
  pkgs,
  ...
}:

let
  cfg = osConfig.ewhsModule.pkgs.tmux;
in
{
  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        sensible
        tmux-powerline
        vim-tmux-navigator
      ];
      keyMode = "vi";
      mouse = true;
    };
  };
}
