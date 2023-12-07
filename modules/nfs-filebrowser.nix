{ config, pkgs, nfs-server, ... }:

{
  fileSystems."/mnt/filebrowser" = {
    device = "${nfs-server}:/mnt/AuxPool/K8S-NFS/filebrowser";
    fsType = "nfs";
    options = [ "nfsvers=4.2" "x-systemd.automount" "noauto" ];
  };
}
