{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    homeModule.pkgs.prusa-slicr.enable = lib.mkEnableOption "Enables Prusa Slicer";
  };

  config = lib.mkIf config.homeModule.pkgs.prusa-slicr.enable {
    home.packages = with pkgs; [ prusa-slicer ];
  };
}
