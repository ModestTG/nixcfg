{ config, userlib, ... }:
{
  imports = map userlib.relativeToRoot [ "hosts/common/optional/services/caddy.nix" ];
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    loadModels = [
      "llama3.3"
    ];
  };
  services.caddy.virtualHosts."ollama.mrd.ewhomelab.com".extraConfig = ''
    reverse_proxy 10.0.20.22:11434
    import ${config.sops.secrets.caddy-cf-tls.path}
  '';
}
