{ pkgs, userlib, ... }:

{
  imports = map userlib.relativeToRoot [
    "home/eweishaar/common/core"
    "home/eweishaar/common/optional/neovim/nixvim.nix"
  ];

  home = rec {
    username = "eweishaar";
    homeDirectory = "/home/${username}";
    packages = with pkgs; [ compose2nix ];
  };
  programs.ssh = {
    extraConfig = ''
      IdentityFile = ~/.ssh/id_mirrodin
    '';
  };
}
