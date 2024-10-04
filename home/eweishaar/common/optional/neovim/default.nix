{ pkgs, userlib, ... }:

{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      gopls
      gofumpt
      goimports-reviser
      golines
      neovim
      nixfmt-rfc-style
      nil
    ];
  };

  xdg.configFile."nvim" = {
    source = userlib.relativeToRoot "home/eweishaar/common/optional/neovim/config";
    recursive = true;
  };
}
