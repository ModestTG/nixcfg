{ pkgs, userlib, ...}:

{
  home.packages = with pkgs; [
    neovim
    nixpkgs-fmt
  ];

  home.file.".config/nvim/" = {
    source = userlib.relativeToRoot "home/eweishaar/common/optional/neovim/config";
    recursive = true;
  };
}
