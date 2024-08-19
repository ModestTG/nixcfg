{ userlib, ... }:

{
  imports = map userlib.relativeToRoot [
    "home/eweishaar/common/core"
    "home/eweishaar/common/optional/desktop"
    "home/eweishaar/common/optional/neovim"
    "home/eweishaar/common/optional/kubernetes.nix"
  ];

  home = rec {
    username = "eweishaar";
    homeDirectory = "/home/${username}";
  };

}
