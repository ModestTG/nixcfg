{
  config,
  lib,
  userlib,
  inputs,
  ...
}:

let
  cfg = config.homeModule;
in
{
  imports = [ inputs.base16.homeManagerModule ];

  options.homeModule.colorscheme = lib.mkOption {
    type = lib.types.str;
    default = "tokyonight";
    description = "Define which colorscheme you want to use";
  };

  config = {
    scheme = lib.mkIf (cfg.colorscheme == "tokyonight") (
      userlib.relativeToRoot "config/tokyonight-night-base16.yaml"
    );
  };
}
