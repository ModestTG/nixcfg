{
  lib,
  pkgs,
  userlib,
  ...
}:
let
  sshKeys = builtins.filter (x: x != [ ] && x != "") (
    builtins.split "\n" (
      builtins.readFile (
        builtins.fetchurl {
          url = "https://github.com/ModestTG.keys";
          sha256 = "1dckb5ixmx76m4q7kry5c9ba1ynciszza15dgl0v9993wi8jhxp7";
        }
      )
    )
  );
in
{
  home-manager.users.eweishaar = import (userlib.relativeToRoot "home/eweishaar/dominaria.nix");

  users = {
    mutableUsers = false;
    users.eweishaar = {
      # generated with `mkpasswd -m scrypt`
      initialHashedPassword = "$7$CU..../....i89TMSGgWw3qQucMUF3WQ/$NbRbMXyTiIM2jMaxKS1vHhTtZ1M7SgbB16eltu2ZYk7";
      home = "/home/eweishaar";
      isNormalUser = true;
      extraGroups = [
        "dialout"
        "docker"
        "eweishaar"
        "networkmanager"
        "wheel"
      ];
      uid = 1000;
      shell = pkgs.bash;
      openssh.authorizedKeys.keys = sshKeys;
    };
    groups = {
      eweishaar = {
        gid = 1000;
        name = "eweishaar";
        members = [ "eweishaar" ];
      };
      mattermost = {
        gid = 2000;
        name = "mattermost";
        members = [ "eweishaar" ];
      };
    };
  };
}
