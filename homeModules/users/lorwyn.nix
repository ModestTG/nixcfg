{ osConfig, lib, ... }:

{
  config = lib.mkIf (osConfig.networking.hostName == "lorwyn") {
    home = rec {
      username = "eweishaar";
      homeDirectory = "/home/${username}";
    };
  };
}
