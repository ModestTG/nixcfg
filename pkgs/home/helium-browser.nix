{ appimageTools, fetchurl }:
let
  pname = "helium-browser";
  version = "0.5.6.1";
  arch = "x86_64";
  src = fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-${arch}.AppImage";
    hash = "sha256-J1hTquA47gim0H7TFMM+JabY5YRcL5snJTpM/elN1zI=";
  };
  appImageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;
  extraInstallCommands = ''
    install -m 444 -D ${appImageContents}/helium.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/helium.desktop --replace 'Exec=AppRun' 'Exec=${pname}'
    install -m 444 -D ${appImageContents}/helium.png $out/share/icons/hicolor/256x256/apps/helium.png
  '';
}
