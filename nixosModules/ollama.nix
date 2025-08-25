{ config, lib, ... }:

let
  cfg = config.nixosModule.svc.ollama;
in
{
  options.nixosModule.svc.ollama = {
    enable = lib.mkEnableOption "enable ollama service";
  };

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
