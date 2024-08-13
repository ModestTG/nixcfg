{config, pkgs, userlib, ...}:

{
  imports = map userlib.relativeToRoot [
    "home/eweishaar/common/core"
    "home/eweishaar/common/optional/desktop"
    "home/eweishaar/common/optional/neovim"
  ];

  home = rec {
    username = "eweishaar";
    homeDirectory = "/home/${username}";
  };

}
