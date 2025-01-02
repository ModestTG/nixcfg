{ userlib, ... }:

{
  imports =
    map userlib.relativeToRoot [
      "hosts/common/optional/services/caddy.nix"
    ]
    ++ (userlib.scanPaths ./.);
}
