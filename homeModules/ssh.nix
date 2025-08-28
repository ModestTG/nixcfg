{ config, lib, ... }:

let
  cfg = config.homeModule.pkgs.ssh;
in
{
  options.homeModule.pkgs.ssh = {
    enable = lib.mkEnableOption "Enable SSH Client Configuration";
  };

  config = lib.mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";
      matchBlocks = {
        "mirrodin" = {
          hostname = "10.0.20.22";
          user = "eweishaar";
        };
        "jace-master-0" = {
          hostname = "10.0.20.10";
          user = "eweishaar";
        };
        "jace-master-1" = {
          hostname = "10.0.20.11";
          user = "eweishaar";
        };
        "jace-master-2" = {
          hostname = "10.0.20.12";
          user = "eweishaar";
        };
        "jace-worker-0" = {
          hostname = "10.0.20.13";
          user = "eweishaar";
        };
        "jace-worker-1" = {
          hostname = "10.0.20.14";
          user = "eweishaar";
        };
      };
    };
  };
}
