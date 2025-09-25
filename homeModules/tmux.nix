{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.homeModule.pkgs.tmux;
in
{
  options.homeModule.pkgs.tmux = {
    enable = lib.mkEnableOption "Enable tmux configuration";
  };

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        sensible
      ];
    };
  };
}
