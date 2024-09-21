{ pkgs, ... }:

let
  xmage-latest = pkgs.xmage.overrideAttrs (old: rec {
    src = pkgs.fetchurl {
      url = "https://github.com/magefree/mage/releases/download/xmage_${version}/mage-full_1.4.54-dev_2024-09-09_11-34.zip";
      sha256 = "132bws1qx26qm0k786bgc5q0m8bnzn2rqs784hb9kh1c6kpm92ph";
    };
    version = "1.4.54V2";
    installPhase = ''
      mkdir -p $out/bin
      cp -rv ./* $out

      cat <<EOS > $out/bin/xmage
      exec ${pkgs.jdk8}/bin/java -Xms256m -Xmx1024m -XX:MaxPermSize=384m -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -jar $out/xmage/mage-client/lib/mage-client-1.4.54.jar
      EOS

      chmod +x $out/bin/xmage'';
  });
in
{

  programs.steam.enable = true;

  environment.systemPackages = [
    xmage-latest
    pkgs.prismlauncher
  ];
}
