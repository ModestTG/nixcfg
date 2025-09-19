{ config, lib, ... }:

let
  cfg = config.nixosModule.svc.ssh;
in
{
  options.nixosModule.svc.ssh = {
    enable = lib.mkEnableOption "enable SSH Server";
  };

  config = lib.mkIf cfg.enable {
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
    security.pam = {
      sshAgentAuth.enable = true;
    };
  };
}
