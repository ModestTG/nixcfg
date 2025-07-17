{
  config,
  inputs,
  lib,
  userlib,
  ...
}:

{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  options = {
    nixosModule.svc.sops.enable = lib.mkEnableOption "enables sops";
  };

  config = lib.mkIf config.nixosModule.svc.sops.enable {

    sops = {
      defaultSopsFile = (userlib.relativeToRoot "secrets/secrets.yaml");
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/eweishaar/.config/sops/age/keys.txt";
    };
  };
}
