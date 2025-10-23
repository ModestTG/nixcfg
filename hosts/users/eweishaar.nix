{ config, pkgs, ... }:

let
  cfg = config.ewhsModule;
in
{

  users = {
    mutableUsers = false;
    users.eweishaar = {
      # generated with `mkpasswd -m scrypt`
      initialHashedPassword = "$7$CU..../....i89TMSGgWw3qQucMUF3WQ/$NbRbMXyTiIM2jMaxKS1vHhTtZ1M7SgbB16eltu2ZYk7";
      isNormalUser = true;
      extraGroups = [
        "dialout"
        "networkmanager"
        "plugdev"
        "wheel"
      ];
      uid = 1000;
      shell = if cfg.shell == "nushell" then pkgs.nushell else pkgs.bash;
    };
  };
}
