{
  services.ollama = {
    enable = true;
    host = "10.0.20.22";
    acceleration = "cuda";
    loadModels = [
      "llama3.3"
    ];
  };
}
