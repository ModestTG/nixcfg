# Auto-generated using compose2nix v0.2.4-pre.
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
  virtualisation.oci-containers.backend = "podman";

  # Containers
  virtualisation.oci-containers.containers."atm9-mc" = {
    image = "itzg/minecraft-server:latest";
    environment = {
      "DIFFICULTY" = "normal";
      "EULA" = "TRUE";
      "FORGE_INSTALLER" = "forge-1.20.1-47.3.7-installer.jar";
      "MEMORY" = "8G";
      "OVERRIDE_SERVER_PROPERTIES" = "TRUE";
      "TYPE" = "FORGE";
      "TZ" = "America/Chicago";
      "VERSION" = "1.20.1";
    };
    volumes = [
      "/home/eweishaar/nixcfg/hosts/common/optional/gaming/minecraft/atm9/minecraft-data:/data:rw"
      "/mnt/k8s-nfs/backups/minecraft/atm9:/data/backups:rw"
    ];
    ports = [
      "25565:25565/tcp"
    ];
    labels = {
      "compose2nix.settings.autoStart" = "false";
    };
    log-driver = "journald";
    autoStart = false;
    extraOptions = [
      "--network-alias=mc"
      "--network=atm9_default"
    ];
  };
  systemd.services."podman-atm9-mc" = {
    serviceConfig = {
      Restart = lib.mkOverride 500 "always";
    };
    after = [
      "podman-network-atm9_default.service"
    ];
    requires = [
      "podman-network-atm9_default.service"
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

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."podman-compose-atm9-root" = {
    unitConfig = {
      Description = "Root target generated by compose2nix.";
    };
  };
}
