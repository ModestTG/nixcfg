{
  inputs,
  config,
  userlib,
  ...
}:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = (userlib.relativeToRoot "secrets/secrets.yaml");
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/eweishaar/.config/sops/age/keys.txt";
  };
}
