{ config, pkgs, ... }:
{
  sops.secrets.restic-repo-password = {
    owner = config.users.users.eweishaar.name;
  };
  environment.systemPackages = [ pkgs.restic ];
  services.restic.backups = {
    home-assistant = {
      user = config.users.users.eweishaar.name;
      repository = "/mnt/k8s-nfs/backups/home-assistant";
      initialize = true;
      passwordFile = config.sops.secrets.restic-repo-password.path;
      paths = [ "/home/eweishaar/nixcfg/hosts/common/optional/services/docker/home-assistant/config" ];
      timerConfig = {
        OnCalendar = "hourly";
      };
      pruneOpts = [
        "--keep-hourly 6"
        "--keep-daily 7"
        "--keep-weekly 5"
        "--keep-monthly 12"
        "--keep-yearly 5"
      ];
    };
  };
}
