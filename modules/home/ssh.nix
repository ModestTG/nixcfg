{ osConfig, lib, ... }:

let
  cfg = osConfig.ewhsModule.pkgs.ssh;
in
{
  config = lib.mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "kaladesh" = {
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
