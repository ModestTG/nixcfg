{ osConfig, lib, ... }:

let
  cfg = osConfig.ewhsModule;
  user = "eweishaar";
  addKeysToAgent = "yes";
in
{
  config = lib.mkIf cfg.pkgs.ssh.enable {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "jace-master-0" = {
          hostname = "10.0.20.10";
          inherit user addKeysToAgent;
        };
        "jace-master-1" = {
          hostname = "10.0.20.11";
          inherit user addKeysToAgent;
        };
        "jace-master-2" = {
          hostname = "10.0.20.12";
          inherit user addKeysToAgent;
        };
        "jace-worker-0" = {
          hostname = "10.0.20.13";
          inherit user addKeysToAgent;
        };
        "jace-worker-1" = {
          hostname = "10.0.20.14";
          inherit user addKeysToAgent;
        };
        "kaladesh" = lib.mkIf cfg.deployNode {
          hostname = "10.0.20.22";
          inherit user addKeysToAgent;
        };
        "vryn" = lib.mkIf cfg.deployNode {
          hostname = "172.238.173.160";
          inherit user addKeysToAgent;
        };
      };
    };
  };
}
