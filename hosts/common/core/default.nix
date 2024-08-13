{ pkgs, userlib, lib, ... }:

{
  imports = userlib.scanPaths ./.;

  environment.systemPackages = with pkgs; [
    git
    bash
    coreutils
    doas
    file
    findutils
    fzf
    gcc
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
}
