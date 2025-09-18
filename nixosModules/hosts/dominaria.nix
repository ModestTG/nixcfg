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
  config = lib.mkIf (config.networking.hostName == "dominaria") {
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
    # Add udev rules for Flipper Zero
    services.udev.extraRules = ''
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", MODE="0666", GROUP="plugdev"
    '';
    sops.secrets."sshKeys/dominaria/private" = {
      path = "/home/eweishaar/.ssh/id_ed25519";
      owner = config.users.users.eweishaar.name;
      group = config.users.users.eweishaar.group;
      mode = "0600";
    };
  };
}
