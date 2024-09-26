{ pkgs, userlib, ... }:

{
  home.packages = with pkgs; [
    go
    gopls
    gofumpt
    goimports-reviser
    golines
    neovim
    nixfmt-rfc-style
    rustc
    cargo
  ];

  xdg.configFile."nvim" = {
    source = userlib.relativeToRoot "home/eweishaar/common/optional/neovim/config";
    recursive = true;
  };
}
