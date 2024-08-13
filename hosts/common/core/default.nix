{pkgs, userlib, lib, ...}:

{
  imports = userlib.scanPaths ./.;

  environment.systemPackages = with pkgs;[
    git
    glibcLocales
    wget
    curl
    vim
    just
  ];

  environment.variables = {
    LOCALE_ARCHIVE = lib.mkDefault "${pkgs.glibcLocales}/lib/locale/locale-archive";
  };
}
