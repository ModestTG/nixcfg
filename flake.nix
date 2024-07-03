{
  description = "EWHS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (inputs.nixpkgs) lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      userlib = import ./lib {inherit lib;};
      userSettings = {
        username = "eweishaar";
      };
    in
    {
      nixosConfigurations = {
        zendikar = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit userSettings;
            inherit userlib;
          };
          modules = [ 
            ./hosts/zendikar
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                inherit userSettings;
                inherit userlib;
              };
              home-manager.users.${userSettings.username} = import ./home;
            }
          ];
        };
      };
    };
}
