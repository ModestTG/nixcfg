{ config, pkgs, ... }:

let 
  authorizedKeys = builtins.fetchurl {
    url = https://github.com/ModestTG.keys;
    sha256 = "sha256:13dz2ms2rfhzw6a3ch4x00w68fjd5c25q4mzabwnnsv7ws7q3cj7";
  };

in {
  services.openssh = {
    enable = true;
    openFirewall = true;
    
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      KexAlgorithms = [
        "sntrup761x25519-sha512@openssh.com"
	"curve25519-sha256"
	"curve25519-sha256@libssh.org"
	"diffie-hellman-group18-sha512"
	"diffie-hellman-group-exchange-sha256"
	"diffie-hellman-group14-sha256"
      ];
    };
  };
  users.users."eweishaar".openssh.authorizedKeys.keyFiles = [ authorizedKeys ];
}
