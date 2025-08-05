{
  inputs,
  userlib,
  pkgs-stable,
  ...
}:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    extraSpecialArgs = { inherit inputs userlib pkgs-stable; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.eweishaar = {
      imports = userlib.scanPaths ../homeModules;

    };
  };
}
