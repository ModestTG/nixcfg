{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:

let
  cfg = osConfig.ewhsModule.pkgs.kube-tools;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      kubectl
      kubectl-cnpg
      k9s
      go-task
      fluxcd
    ];

    programs.k9s = {
      enable = true;
      settings.k9s = lib.mkOptionDefault {
        cluster = "default";
      };
    };
  };
}
