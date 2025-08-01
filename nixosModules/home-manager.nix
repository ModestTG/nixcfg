{ inputs, userlib, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    extraSpecialArgs = { inherit inputs userlib; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.eweishaar = {
      imports = userlib.scanPaths ../homeModules;

    };
  };
}
