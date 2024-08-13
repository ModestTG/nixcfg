{ pkgs, userlib, ...}:

{
  home.packages = with pkgs; [
    neovim
  ];

  home.file.".config/nvim/" = {
    source = userlib.relativeToRoot "home/eweishaar/common/optional/neovim/config";
    recursive = true;
  };
}
