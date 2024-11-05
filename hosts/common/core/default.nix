{ pkgs, userlib, ... }:

{
  imports = userlib.scanPaths ./.;

  environment.systemPackages = with pkgs; [
    age
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
    nh
    nix-index
    nix-ld
    nurl
    p7zip
    pciutils
    pfetch
    pre-commit
    pwgen
    sops
    tldr
    tmux
    tree
    unrar
    unzip
    usbutils
    vim
    vulnix
    wget
    zip
    zstd
  ];
}
