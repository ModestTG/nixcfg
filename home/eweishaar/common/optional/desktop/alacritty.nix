{
  inputs,
  ...
}:

{
  programs.alacritty =
    let
      family = "FiraCode Nerd Font Mono";
    in
    {
      enable = true;
      settings = {
        import = [ "${inputs.theme_tokyonight}/extras/alacritty/tokyonight_night.toml" ];
        font = {
          normal = {
            inherit family;
            style = "Regular";
          };
        };
      };
    };
}
