{
  programs.nixvim = {
    # Collection of various small independent plugins/modules
    # https://nix-community.github.io/nixvim/plugins/mini.html
    plugins.luasnip = {
      enable = true;

    };
  };
}
