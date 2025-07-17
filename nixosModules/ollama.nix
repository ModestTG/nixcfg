{ config, lib, ... }:

{
  options = {
    nixosModule.svc.ollama.enable = lib.mkEnableOption "enable ollama service";
  };

  config = lib.mkIf config.nixosModule.svc.ollama.enable {
    services.ollama = {
      enable = true;
      acceleration = "cuda";
      loadModels = [
        "llama3.3"
      ];
    };
  };
}
