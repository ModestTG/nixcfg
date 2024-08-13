{pkgs, userlib, lib, ...}:

{
  imports = userlib.scanPaths ./.;

  environment.systemPackages = with pkgs;[
    git
    bash
    coreutils
    glibcLocales
    doas
    file
    findutils
    fzf
    jq
    p7zip
    pciutils
    pfetch
    pre-commit
    tldr
    tmux
    tree
    unrar
    unzip
    usbutils
    zip
    zstd
    wget
    curl
    vim
    just
  ];

  environment.variables = {
    LOCALE_ARCHIVE = lib.mkDefault "${pkgs.glibcLocales}/lib/locale/locale-archive";
  };
}
