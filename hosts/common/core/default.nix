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
    nix-ld
    nurl
    p7zip
    pciutils
    pfetch
    pre-commit
    sops
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
