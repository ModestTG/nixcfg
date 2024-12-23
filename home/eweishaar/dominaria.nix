{ userlib, ... }:

{
  imports = map userlib.relativeToRoot [
    "home/eweishaar/common/core"
    "home/eweishaar/common/optional/audible2m4b.nix"
    "home/eweishaar/common/optional/desktop"
    "home/eweishaar/common/optional/kubernetes.nix"
    "home/eweishaar/common/optional/neovim/nixvim.nix"
    "home/eweishaar/common/optional/services/syncthing.nix"
  ];

  home = rec {
    username = "eweishaar";
    homeDirectory = "/home/${username}";
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "calc.desktop";
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
}
