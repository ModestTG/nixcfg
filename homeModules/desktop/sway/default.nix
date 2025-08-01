{
  config,
  lib,
  userlib,
  ...
}:

{
  imports = lib.optionalModules (config.homeModule.desktop.wm == "sway") (userlib.scanPaths ./.);
}
