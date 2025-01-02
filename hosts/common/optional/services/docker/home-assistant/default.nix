{
  config,
  userlib,
  ...
}:

{
  imports = userlib.scanPaths ./.;

  services.caddy.virtualHosts."hass.mrd.ewhomelab.com".extraConfig = ''
    reverse_proxy http://10.0.20.22:8123
    import ${config.sops.secrets.caddy-cf-tls.path}
  '';
}
