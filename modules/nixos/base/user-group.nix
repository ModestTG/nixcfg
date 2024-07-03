{ lib, userSettings, ... }:

{
  users = {
    mutableUsers = false;
    users."${userSettings.username}" = {
      # generated with `mkpasswd -m scrypt`
      initialHashedPassword = "$7$CU..../....i89TMSGgWw3qQucMUF3WQ/$NbRbMXyTiIM2jMaxKS1vHhTtZ1M7SgbB16eltu2ZYk7"; 
      home = "/home/${userSettings.username}";
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
      uid = 1000;
    };
  };
}
