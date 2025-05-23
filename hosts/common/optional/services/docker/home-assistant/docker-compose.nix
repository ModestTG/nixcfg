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
  virtualisation.oci-containers.containers."esphome" = {
    image = "ghcr.io/esphome/esphome:2025.2.0";
    environment = {
      "ESPHOME_DASHBOARD_USE_PING" = "true";
    };
    volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "home-assistant_esphome-config:/config:rw"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network=host"
      "--privileged"
    ];
  };
  systemd.services."podman-esphome" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-volume-home-assistant_esphome-config.service"
    ];
    requires = [
      "podman-volume-home-assistant_esphome-config.service"
    ];
    partOf = [
      "podman-compose-home-assistant-root.target"
    ];
    wantedBy = [
      "podman-compose-home-assistant-root.target"
    ];
  };
  virtualisation.oci-containers.containers."home-assistant" = {
    image = "ghcr.io/home-operations/home-assistant:2025.3.4";
    volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "/home/eweishaar/nixcfg/hosts/common/optional/services/docker/home-assistant/config:/config:rw"
      "/run/dbus:/run/dbus:ro"
    ];
    user = "1000:100";
    log-driver = "journald";
    extraOptions = [
      "--network=host"
      "--privileged"
    ];
  };
  systemd.services."podman-home-assistant" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    partOf = [
      "podman-compose-home-assistant-root.target"
    ];
    wantedBy = [
      "podman-compose-home-assistant-root.target"
    ];
  };
  virtualisation.oci-containers.containers."node-red" = {
    image = "nodered/node-red:4.0.9";
    environment = {
      "TZ" = "America/Chicago";
    };
    volumes = [
      "home-assistant_node-red-config:/data:rw"
    ];
    ports = [
      "1880:1880/tcp"
    ];
    user = "1000:100";
    log-driver = "journald";
    extraOptions = [
      "--network-alias=node-red"
      "--network=home-assistant_default"
    ];
  };
  systemd.services."podman-node-red" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-home-assistant_default.service"
      "podman-volume-home-assistant_node-red-config.service"
    ];
    requires = [
      "podman-network-home-assistant_default.service"
      "podman-volume-home-assistant_node-red-config.service"
    ];
    partOf = [
      "podman-compose-home-assistant-root.target"
    ];
    wantedBy = [
      "podman-compose-home-assistant-root.target"
    ];
  };

  # Networks
  systemd.services."podman-network-home-assistant_default" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "podman network rm -f home-assistant_default";
    };
    script = ''
      podman network inspect home-assistant_default || podman network create home-assistant_default
    '';
    partOf = [ "podman-compose-home-assistant-root.target" ];
    wantedBy = [ "podman-compose-home-assistant-root.target" ];
  };

  # Volumes
  systemd.services."podman-volume-home-assistant_esphome-config" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect home-assistant_esphome-config || podman volume create home-assistant_esphome-config
    '';
    partOf = [ "podman-compose-home-assistant-root.target" ];
    wantedBy = [ "podman-compose-home-assistant-root.target" ];
  };
  systemd.services."podman-volume-home-assistant_node-red-config" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect home-assistant_node-red-config || podman volume create home-assistant_node-red-config
    '';
    partOf = [ "podman-compose-home-assistant-root.target" ];
    wantedBy = [ "podman-compose-home-assistant-root.target" ];
  };

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."podman-compose-home-assistant-root" = {
    unitConfig = {
      Description = "Root target generated by compose2nix.";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
