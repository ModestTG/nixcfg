{ pkgs, ... }:
let
  rsync-backup-ha = pkgs.writeShellApplication {
    name = "rsync-backup-ha";
    runtimeInputs = [
      pkgs.rsync
      pkgs.util-linux
    ];
    text = # bash
      ''
        # Source and destination directories
        SRC_DIR="/home/eweishaar/nixcfg/hosts/common/optional/docker/home-assistant/config/"
        DEST_DIR="/mnt/k8s-nfs/backups/home-assistant/"

        # Ensure directories exist
        if [ ! -d "$SRC_DIR" ] || [ ! -d "$DEST_DIR" ]; then
          echo "Error: Source or destination directory does not exist"
          exit 1
        fi

        # Perform the sync with root permissions preserved
        rsync -av --no-perms --no-owner --no-group "$SRC_DIR/" "$DEST_DIR/"
      '';
  };
in
{
  systemd.services.rsync-backup-ha = {
    description = "Backup Service: Home Assistant";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${rsync-backup-ha}/bin/rsync-backup-ha";
      User = "eweishaar";
    };
  };

  systemd.timers.rsync-backup-ha = {
    description = "Timer for Backup Service: Home Assistant service";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5min";
      OnUnitActiveSec = "15min";
      Unit = "rsync-backup-ha.service";
    };
  };
}
