{ userlib, ... }:

{
  imports = (map userlib.relativeToRoot [
    "home/eweishaar/common/optional/desktop/sway"
    "home/eweishaar/common/optional/desktop/alacritty.nix"
  ]);
}
