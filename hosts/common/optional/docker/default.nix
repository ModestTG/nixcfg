{ userlib, ... }:

{
  imports = userlib.scanPaths ./.;
}