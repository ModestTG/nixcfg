{
  config,
  inputs,
  lib,
  userlib,
  ...
}:

let
  cfg = config.ewhsModule.svc.sops;
in
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  config = lib.mkIf cfg.enable {
    sops = {
      defaultSopsFile = (userlib.relativeToRoot "secrets/secrets.yaml");
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/eweishaar/.config/sops/age/keys.txt";
    };
  };
}
