{ config, lib, ... }:

{
  options = {
    homeModule.pkgs.ssh.enable = lib.mkEnableOption "Enable SSH Client Configuration";
  };

  config = lib.mkIf config.homeModule.pkgs.ssh.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };
  };
}
