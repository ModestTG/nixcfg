{
  userlib,
  inputs,
  ...
}:

{
  # Packages are installed at the system level

  imports = [
    inputs.base16.homeManagerModule
    { scheme = (userlib.relativeToRoot "config/tokyonight-night-base16.yaml"); }
  ] ++ (userlib.scanPaths ./.);
}
