{
  config,
  inputs,
  lib,
  userlib,
  ...
}:

let
  cfg = config.nixosModule.svc.sops;
in
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  options.nixosModule.svc.sops = {
    enable = lib.mkEnableOption "enables sops";
  };

  config = lib.mkIf cfg.enable {

    sops = {
      defaultSopsFile = (userlib.relativeToRoot "secrets/secrets.yaml");
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/eweishaar/.config/sops/age/keys.txt";
    };
  };
}
