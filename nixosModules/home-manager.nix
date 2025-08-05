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
    backupFileExtension = "hmbackup";
    users.eweishaar = {
      imports = [ ../homeModules/default.nix ];
      nixpkgs.config.allowUnfree = true;
    };
  };
}
