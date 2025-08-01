{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    homeModule.pkgs.audible2m4b.enable = lib.mkEnableOption "Install audible2m4b program";
  };

  config = lib.mkIf config.homeModule.pkgs.audible2m4b.enable {
    home.packages =
      let
        audible2m4b = pkgs.writeShellApplication {
          name = "audible2m4b";
          runtimeInputs = [ pkgs.ffmpeg ];
          text = ''
            ffmpeg -y -activation_bytes dfa8f705 -i "$1" -c copy output.m4b
          '';
        };
      in
      [ audible2m4b ];
  };
}
