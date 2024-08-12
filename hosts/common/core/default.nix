{pkgs, userlib, ...}:

{
  imports = userlib.scanPaths ./.;

  environment.systemPackages = with pkgs;[
    git
    wget
    curl
    vim
    just
  ];
}
