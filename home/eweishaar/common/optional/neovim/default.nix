{ inputs, ... }:

{
  nixpkgs.overlays = [ inputs.nvim-nix.overlays.default ];
  environment.systemPackages = with pkgs; [ nvim-pkg ];
}
