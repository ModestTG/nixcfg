{
  inputs,
  lib,
  osConfig,
  userlib,
  ...
}:

let
  cfg = osConfig.ewhsModule;
in
{
  imports = [ inputs.base16.homeManagerModule ];

  config = {
    scheme = lib.mkIf (cfg.colorscheme == "tokyonight") (
      userlib.relativeToRoot "config/tokyonight-night-base16.yaml"
    );
  };
}
