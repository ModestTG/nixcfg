{ config, lib, ... }:

let
  cfg = config.ewhsModule.svc.ollama;
in
{
  config = lib.mkIf cfg.enable {
    services.ollama = {
      enable = true;
      acceleration = "cuda";
      loadModels = [
        "llama3.3"
      ];
    };
  };
}
