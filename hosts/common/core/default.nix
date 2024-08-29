{ pkgs, userlib, ... }:

{
  imports = userlib.scanPaths ./.;

  environment.systemPackages = with pkgs; [
    bash
    bc
    coreutils
    curl
    dig
    doas
    file
    findutils
    fzf
    gcc
    git
    jq
    just
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
    vim
    wget
    zip
    zstd
  ];
}
