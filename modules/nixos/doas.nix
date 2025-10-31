{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.ewhsModule.doas;
in
{
  config = lib.mkIf cfg.enable {
    security.doas = {
      enable = true;
      extraRules = [
        {
          users = [ "eweishaar" ];
          persist = true;
          keepEnv = true;
        }
      ];
    };
    security.sudo.enable = false;
    # Workaround of https://github.com/nix-community/nh/issues/236
    # environment.systemPackages = [ (pkgs.writeShellScriptBin "sudo" "doas $@") ];
  };
}
