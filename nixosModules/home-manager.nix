{
  inputs,
  lib,
  pkgs-stable,
  userlib,
  ...
}:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    extraSpecialArgs = { inherit inputs userlib pkgs-stable; };
    backupFileExtension = "hmbackup";
    users.eweishaar = {
      imports = [ ../homeModules/default.nix ];
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
}
