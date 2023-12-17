{lib, config, pkgs, ... }:

{
  options = {
    main-user.enable = lib.mkEnableOption "enable user module";
    main-user.username = lib.mkOption {
      default = "main-user";
      description = ''
        username
      '';
    };
  };
  config = lib.mkIf config.main-user.enable {
    users.users.${config.main-user.username} = {
      isNormalUser = true;
      initialPassword = "password";
      description = "main user";
      shell = pkgs.bash;
    };
  };
}
