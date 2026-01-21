{ appimageTools }:
let
  pname = "helium-browser";
  version = "0.8.2.1";
  arch = "x86_64";
  src = builtins.fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-${arch}.AppImage";
    sha256 = "0vvmk8ljhql10mlx8mhlyza534155cqxkf6ii4m66iwshnklgcv9";
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
