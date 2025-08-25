{ osConfig, lib, ... }:

{
  config = lib.mkIf (osConfig.networking.hostName == "dominaria") {

    homeModule = {
      terminal = "ghostty";
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
    home = rec {
      username = "eweishaar";
      homeDirectory = "/home/${username}";
      stateVersion = "24.11";
    };
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "calc.desktop";
        "inode/directory" = "thunar.desktop"; # File Browser
      };
    };
    programs.ssh = {
      matchBlocks = {
        "mirrodin" = {
          hostname = "10.0.20.22";
          user = "eweishaar";
        };
        "jace-master-0" = {
          hostname = "10.0.20.10";
          user = "eweishaar";
        };
        "jace-master-1" = {
          hostname = "10.0.20.11";
          user = "eweishaar";
        };
        "jace-master-2" = {
          hostname = "10.0.20.12";
          user = "eweishaar";
        };
        "jace-worker-0" = {
          hostname = "10.0.20.13";
          user = "eweishaar";
        };
        "jace-worker-1" = {
          hostname = "10.0.20.14";
          user = "eweishaar";
        };
      };
      extraConfig = ''
        IdentityFile ~/.ssh/id_dominaria
      '';
    };
  };
}
