{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.home-manager.users.eweishaar.homeModule;
in
{
  config = lib.mkIf (config.networking.hostName == "mirrodin") {
    users = {
      mutableUsers = false;
      users.eweishaar = {
        # generated with `mkpasswd -m scrypt`
        initialHashedPassword = "$7$CU..../....i89TMSGgWw3qQucMUF3WQ/$NbRbMXyTiIM2jMaxKS1vHhTtZ1M7SgbB16eltu2ZYk7";
        isNormalUser = true;
        extraGroups = [
          "networkmanager"
          "wheel"
          "docker"
        ];
        uid = 1000;
        shell = if cfg.shell == "nushell" then pkgs.nushell else pkgs.bash;
      };
    };
    sops.secrets."sshKeys/mirrodin/public" = {
      path = "/home/eweishaar/.ssh/id_ed25519.pub";
      owner = config.users.users.eweishaar.name;
      group = config.users.users.eweishaar.group;
    };
    sops.secrets."sshKeys/mirrodin/private" = {
      path = "/home/eweishaar/.ssh/id_ed25519";
      owner = config.users.users.eweishaar.name;
      group = config.users.users.eweishaar.group;
      mode = "0600";
    };
  };
}
