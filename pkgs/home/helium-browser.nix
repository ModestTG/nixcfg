{ appimageTools, fetchurl }:
let
  pname = "helium-browser";
  version = "0.5.5.2";
  arch = "x86_64";
  src = fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-${arch}.AppImage";
    hash = "sha256-2f/veXeUMr/chh0YSBLD862nv5RtJy5qlaA7fhurWoA=";
  };
in
appimageTools.wrapType2 { inherit pname version src; }
