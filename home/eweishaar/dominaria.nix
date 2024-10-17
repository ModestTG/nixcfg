{ userlib, ... }:

{
  imports = map userlib.relativeToRoot [
    "home/eweishaar/common/core"
    "home/eweishaar/common/optional/desktop"
    "home/eweishaar/common/optional/neovim/nixvim.nix"
    "home/eweishaar/common/optional/kubernetes.nix"
    "home/eweishaar/common/optional/audible2m4b.nix"
  ];

  home = rec {
    username = "eweishaar";
    homeDirectory = "/home/${username}";
  };

}
