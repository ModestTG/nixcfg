{
  osConfig,
  lib,
  pkgs,
  ...
}:

let
  cfg = osConfig.ewhsModule.pkgs.prusa-slicr;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ prusa-slicer ];
  };
}
