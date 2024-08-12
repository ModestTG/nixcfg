{config, pkgs, userlib, ...}:

{
  imports = map userlib.relativeToRoot [
    "home/eweishaar/common/core"
    "home/eweishaar/common/optional/desktop"
  ];

  home = rec {
    username = "eweishaar";
    homeDirectory = "/home/${username}";
  };

}
