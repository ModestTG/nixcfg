{
  config,
  userlib,
  ...
}:

{
  imports = userlib.scanPaths ./.;

  services.caddy.virtualHosts."hass.mrd.ewhomelab.com".extraConfig = ''
    reverse_proxy 10.0.20.22:8123
    import ${config.sops.secrets.caddy-cf-tls.path}
  '';
  services.caddy.virtualHosts."esphome.mrd.ewhomelab.com".extraConfig = ''
    reverse_proxy 10.0.20.22:6052
    import ${config.sops.secrets.caddy-cf-tls.path}
  '';
  services.caddy.virtualHosts."node-red.mrd.ewhomelab.com".extraConfig = ''
    reverse_proxy 10.0.20.22:1880
    import ${config.sops.secrets.caddy-cf-tls.path}
  '';
}
