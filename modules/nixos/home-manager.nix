{
  config,
  inputs,
  lib,
  pkgs-stable,
  userlib,
  ...
}:

let
  cfg = config.ewhsModule;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  config = lib.mkIf cfg.homeManager.enable {
    home-manager = {
      extraSpecialArgs = { inherit inputs userlib pkgs-stable; };
      backupFileExtension = "hmbackup";
      users.eweishaar = {
        imports = [ ../home/default.nix ];
        nixpkgs = {
          config = {
            allowUnfree = true;
          };
          overlays = [
            (
              self: super:
              lib.packagesFromDirectoryRecursive {
                callPackage = super.callPackage;
                directory = userlib.relativeToRoot "pkgs/home";
              }
            )
          ];
        };
      };
    };
  };
}
