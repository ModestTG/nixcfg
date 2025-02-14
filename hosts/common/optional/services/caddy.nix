{ pkgs, config, ... }:

{
  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      # if version doesn't exist at source. You can use `go mod init temp; go get <module>` to get version.
      # Check go.mod for source version. See https://github.com/NixOS/nixpkgs/pull/358586#discussion_r1869982579
      plugins = [ "github.com/caddy-dns/cloudflare@v0.0.0-20240703190432-89f16b99c18e" ];
      hash = "sha256-JVkUkDKdat4aALJHQCq1zorJivVCdyBT+7UhqTvaFLw=";
    };
  };
  sops.secrets.caddy-cf-tls = {
    owner = config.users.users.caddy.name;
  };
}
