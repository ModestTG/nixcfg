# Auto-generated using compose2nix v0.3.1.
{ pkgs, lib, ... }:

{
  # Runtime
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    dockerCompat = true;
    defaultNetwork.settings = {
      # Required for container networking to be able to use names.
      dns_enabled = true;
    };
  };

  # Enable container name DNS for non-default Podman networks.
  # https://github.com/NixOS/nixpkgs/issues/226365
  networking.firewall.interfaces."podman+".allowedUDPPorts = [ 53 ];

  virtualisation.oci-containers.backend = "podman";

  # Containers
  virtualisation.oci-containers.containers."atm9-mc" = {
    image = "itzg/minecraft-server";
    environment = {
      "CF_FILENAME_MATCHER" = "1.0.7";
      "CF_PAGE_URL" = "https://www.curseforge.com/minecraft/modpacks/all-the-mods-9";
      "DIFFICULTY" = "normal";
      "EULA" = "true";
      "MEMORY" = "8G";
      "MODPACK_PLATFORM" = "AUTO_CURSEFORGE";
      "TZ" = "America/Chicago";
    };
    environmentFiles = [
      "/home/eweishaar/nixcfg/hosts/common/optional/gaming/minecraft/atm9/.env"
    ];
    volumes = [
      "/mnt/k8s-nfs/backups/minecraft/atm9:/data/backups:rw"
      "atm9_mc-data:/data:rw"
    ];
    ports = [
      "25565:25565/tcp"
    ];
    labels = {
      "compose2nix.settings.autoStart" = "false";
    };
    user = "1000:1000";
    log-driver = "journald";
    autoStart = false;
    extraOptions = [
      "--network-alias=mc"
      "--network=atm9_default"
    ];
  };
  systemd.services."podman-atm9-mc" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "no";
    };
    after = [
      "podman-network-atm9_default.service"
      "podman-volume-atm9_mc-data.service"
    ];
    requires = [
      "podman-network-atm9_default.service"
      "podman-volume-atm9_mc-data.service"
    ];
  };

  # Networks
  systemd.services."podman-network-atm9_default" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "podman network rm -f atm9_default";
    };
    script = ''
      podman network inspect atm9_default || podman network create atm9_default
    '';
    partOf = [ "podman-compose-atm9-root.target" ];
    wantedBy = [ "podman-compose-atm9-root.target" ];
  };

  # Volumes
  systemd.services."podman-volume-atm9_mc-data" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect atm9_mc-data || podman volume create atm9_mc-data
    '';
    partOf = [ "podman-compose-atm9-root.target" ];
    wantedBy = [ "podman-compose-atm9-root.target" ];
  };

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."podman-compose-atm9-root" = {
    unitConfig = {
      Description = "Root target generated by compose2nix.";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
