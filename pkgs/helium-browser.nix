{ appimageTools }:
let
  pname = "helium-browser";
  version = "0.7.9.1";
  arch = "x86_64";
  src = builtins.fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-${arch}.AppImage";
    sha256 = "08vgld73dyzf6yg9rswxqza6rnii1ck97wvjha3ly9jgs9sbrp7b";

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
