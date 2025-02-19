{ config, ... }:

{
  sops.secrets.mosquitto-password = {
    owner = config.users.users.eweishaar.name;
  };
  services.mosquitto = {
    enable = true;
    listeners = [
      {
        address = "10.0.20.22";
        port = 9001;
        settings.protocol = "websockets";
        users.eweishaar = {
          acl = [
            "readwrite #"
          ];
          passwordFile = config.sops.secrets.mosquitto-password.path;
        };
      }
      {
        address = "10.0.20.22";
        port = 1883;
        users.eweishaar = {
          acl = [
            "readwrite #"
          ];
          passwordFile = config.sops.secrets.mosquitto-password.path;
        };
      }
    ];
  };
}
