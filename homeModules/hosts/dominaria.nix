{
  config,
  osConfig,
  lib,
  ...
}:

let
  cfg = config.homeModule;
in
{
  config = lib.mkIf (osConfig.networking.hostName == "dominaria") {
    homeModule = {
      shell = "bash";
      browser = "zen";
      pkgs = {
        audible2m4b.enable = true;
        git.enable = true;
        kube-tools.enable = true;
        nvim.enable = true;
        prusa-slicr.enable = true;
        starship.enable = true;
        ssh.enable = true;
        tmux.enable = true;
      };
      desktop = {
        bar = "waybar";
        enable = true;
        nerdFonts.enable = true;
        launcher = "wofi";
        notifier = "dunst";
        sessionManager = "wlogout";
        wm = "sway";
      };
      svc = {
        syncthing.enable = true;
      };
    };
    home = {
      username = "eweishaar";
      homeDirectory = "/home/eweishaar";
      stateVersion = "24.11";
    };
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "calc.desktop";
        "inode/directory" = "thunar.desktop"; # File Browser
      };
    };
    # Force overwrite mimeapps.list to avoid backup conflicts
    # https://github.com/nix-community/home-manager/issues/4199
    xdg.configFile."mimeapps.list".force = true;
  };
}
