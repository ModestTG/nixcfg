{
  osConfig,
  lib,
  pkgs,
  ...
}:

let
  cfg = osConfig.ewhsModule.pkgs.tmux;
  quadlets = pkgs.writeShellApplication {
    name = "tms-quadlets";
    runtimeInputs = [ pkgs.tmux ];
    text = # bash
      ''
        SESSION_NAME="quadlets"
        SERVER="mirrodin"

        # Create a new detached session
        tmux new-session -d -s "$SESSION_NAME"

        # Split the window: vertical split
        tmux split-window -h -t "$SESSION_NAME"

        # Now split the left pane vertically
        tmux split-window -v -t "$SESSION_NAME":0.0

        # === Send commands to each pane ===

        # Pane 1 (top-left): SSH and go to systemd dir
        tmux send-keys -t "$SESSION_NAME":0.0 "ssh $SERVER" Enter
        tmux send-keys -t "$SESSION_NAME":0.0 "cd ~/.config/containers/systemd" Enter

        # Pane 2 (bottom-left): SSH and go to storage dir
        tmux send-keys -t "$SESSION_NAME":0.1 "ssh $SERVER" Enter
        tmux send-keys -t "$SESSION_NAME":0.1 "cd ~/containers/storage" Enter

        # Pane 3 (right): SSH and journalctl --user -f
        tmux send-keys -t "$SESSION_NAME":0.2 "ssh $SERVER" Enter
        tmux send-keys -t "$SESSION_NAME":0.2 "journalctl --user -f" Enter

        tmux attach -t $SESSION_NAME
      '';
  };
in
{
  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        sensible
        tmux-powerline
        tokyo-night-tmux
        vim-tmux-navigator
      ];
      keyMode = "vi";
      mouse = true;
    };
    home.packages = lib.optionals (lib.elem "quadlets" cfg.sessions) [ quadlets ];
  };
}
