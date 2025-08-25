{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.homeModule.pkgs.prusa-slicr;
in
{
  options.homeModule.pkgs.prusa-slicr = {
    enable = lib.mkEnableOption "Enables Prusa Slicer";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ prusa-slicer ];
  };
}
