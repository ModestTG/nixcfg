{pkgs, uservars, ...}:

{
  environment.systemPackages = with pkgs; [
    nfs-utils
  ];

  fileSystems = {
    "/mnt/filebrowser" = {
      device = "${uservars.nfsServer}:/mnt/AuxPool/K8S-NFS/filebrowser";
      fsType = "nfs";
    };
    "/mnt/immich-photos" = {
      device = "${uservars.nfsServer}:/mnt/AuxPool/K8S-NFS/immich-photos";
      fsType = "nfs";
    };
    "/mnt/audiobookshelf" = {
      device = "${uservars.nfsServer}:/mnt/AuxPool/K8S-NFS/audiobookshelf";
      fsType = "nfs";
    };
    "/mnt/paperless-ngx" = {
      device = "${uservars.nfsServer}:/mnt/AuxPool/K8S-NFS/paperless-ngx";
      fsType = "nfs";
    };
    "/mnt/plexpool" = {
      device = "${uservars.nfsServer}:/mnt/PlexPool";
      fsType = "nfs";
    };
  };    
}
