{
  description = "EWHS Flake";
  
  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

      home-manager = { 
        url = "github:nix-community/home-manager/release-23.11";
        inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        zendikar = lib.nixosSystem {
          inherit system;
          modules = [ (./. + "/profiles/"+("/"+profile)+"/configuration.nix") ];
          specialArgs = {
            inherit username;
            inherit name;
            inherit hostname;
            inherit timezone;
            inherit locale;
            inherit theme;
            inherit font;
            inherit fontPkg;
            inherit wm;
	    inherit nfs-server;
          };
        };
      };
      homeConfigurations = {
        eweishaar = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ (./. + "/profiles"+("/"+profile)+"/home.nix") ];
          extraSpecialArgs = {
	    inherit username; 
	    inherit name; 
	    inherit email; 
	    inherit dotfilesDir; 
	    inherit theme; 
	    inherit wm; 
	    inherit wmType; 
	    inherit browser; 
	    inherit editor; 
	    inherit term; 
	    inherit font; 
	    inherit fontPkg; 
          }; 
        };
      };
    };
}
