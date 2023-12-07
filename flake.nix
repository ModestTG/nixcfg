{
  description = "EWHS Flake";
  
  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
      home-manager.url = "github:nix-community/home-manager/release-23.11";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ...}: 
    let
      # ---- SYSTEM SETTINGS ---- #
      system = "x86_64-linux";
      hostname = "zendikar";
      profile = "zendikar"; # select a profile defined in the profiles directory
      timezone = "US/Central"; 
      locale = "en_US.UTF-8";
      nfs-server = "10.0.0.8";

      # ---- USER SETTINGS ---- #
      username = "eweishaar";
      name = "Elliot Weishaar";
      email = "elliotweishaar27@gmail.com";
      dotfilesDir = "~/.dotfiles";
      theme = "nord";
      wm = "hyprland";
      wmType = "wayland";
      browser = "brave";
      editor = "vim";
      term = "alacritty";
      font = "Fira Code Nerdfont";
      fontPkg = pkgs.fira-code-nerdfont;

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
