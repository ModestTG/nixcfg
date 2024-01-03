{ config, pkgs, ... }:

{
  fileSystems."/mnt/filebrowser" = {
    device = "10.0.0.8:/mnt/AuxPool/K8S-NFS/filebrowser";
    fsType = "nfs";
    options = [ "nfsvers=4.2" "x-systemd.automount" "noauto" ];
  };
}
