{
  config,
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
          sha256 = "sha256:0r280j7yhyfknnpb0gd4a2ad9w7374dy5w8hn460awby7vs10ga1";
        }
      )
    )
  );
in
{
  config = lib.mkIf (config.networking.hostName == "mirrodin") {
    home-manager.users.eweishaar = import (userlib.relativeToRoot "home/eweishaar/mirrodin.nix");

    users = {
      mutableUsers = false;
      users.eweishaar = {
        # generated with `mkpasswd -m scrypt`
        initialHashedPassword = "$7$CU..../....i89TMSGgWw3qQucMUF3WQ/$NbRbMXyTiIM2jMaxKS1vHhTtZ1M7SgbB16eltu2ZYk7";
        home = "/home/eweishaar";
        isNormalUser = true;
        extraGroups = [
          "networkmanager"
          "wheel"
          "eweishaar"
          "docker"
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
      };
    };
  };
}
