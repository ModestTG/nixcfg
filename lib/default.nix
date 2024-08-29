{ lib, ... }:

{
  # user path relative to the root of the project
  # credit: https://github.com/EmergentMind/nix-config/lib/default.nix
  relativeToRoot = lib.path.append ../.;
  # import all .nix files
  # credit: https://github.com/ryan4yin/nix-config/lib/default.nix
  scanPaths =
    path:
    builtins.map (f: (path + "/${f}")) (
      builtins.attrNames (
        lib.attrsets.filterAttrs (
          path: _type:
          (_type == "directory") # include directories
          || (
            (path != "default.nix") # ignore default.nix
            && (lib.strings.hasSuffix ".nix" path) # include .nix files
          )
        ) (builtins.readDir path)
      )
    );
}
