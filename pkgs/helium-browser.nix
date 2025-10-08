{ appimageTools, fetchurl }:
let
  pname = "helium-browser";
  version = "0.5.3.1";
  arch = "x86_64";
  src = fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-${arch}.AppImage";
    hash = "sha256-uPFO1xvL0Uc4eBWZ7yvWoKErUpbyrUDyOMIboOVlzxw=";
  };
in
appimageTools.wrapType2 { inherit pname version src; }
