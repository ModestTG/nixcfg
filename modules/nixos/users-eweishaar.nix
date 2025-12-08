{
  config,
  lib,
  pkgs,
  ...
}:

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
        "dialout" # Serial connection support
        "wheel"
        config.users.groups.media.name
      ]
      ++ lib.optional config.networking.networkmanager.enable "networkmanager"
      ++ lib.optional (lib.elem "docker" cfg.virt.platforms) "docker";
      uid = 1000;
      shell = if cfg.shell == "nushell" then pkgs.nushell else pkgs.bash;
      linger = lib.mkIf (lib.elem "podman" cfg.virt.platforms) true;
    };
    groups.media = {
      gid = 1100;
      name = "media";
    };
  };
}
