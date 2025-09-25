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
      enableDefaultConfig = false;
      matchBlocks = {
        "mirrodin" = {
          hostname = "10.0.20.22";
          user = "eweishaar";
          addKeysToAgent = "yes";
        };
        "jace-master-0" = {
          hostname = "10.0.20.10";
          user = "eweishaar";
          addKeysToAgent = "yes";
        };
        "jace-master-1" = {
          hostname = "10.0.20.11";
          user = "eweishaar";
          addKeysToAgent = "yes";
        };
        "jace-master-2" = {
          hostname = "10.0.20.12";
          user = "eweishaar";
          addKeysToAgent = "yes";
        };
        "jace-worker-0" = {
          hostname = "10.0.20.13";
          user = "eweishaar";
          addKeysToAgent = "yes";
        };
        "jace-worker-1" = {
          hostname = "10.0.20.14";
          user = "eweishaar";
          addKeysToAgent = "yes";
        };
      };
    };
  };
}
