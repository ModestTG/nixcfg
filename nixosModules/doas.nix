{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    nixosModule.doas.enable = lib.mkEnableOption "replaces sudo with doas";
  };
  config = lib.mkIf config.nixosModule.doas.enable {
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
    environment.systemPackages = [ (pkgs.writeShellScriptBin "sudo" "doas $@") ];
  };
}
