{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ kubectl k9s ];
}
