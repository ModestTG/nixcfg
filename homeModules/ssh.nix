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
    };
  };
}
