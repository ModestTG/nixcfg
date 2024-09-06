{
  userlib,
  pkgs,
  ...
}:

{
  imports = (
    map userlib.relativeToRoot [
      "home/eweishaar/common/optional/desktop/sway"
      "home/eweishaar/common/optional/desktop/alacritty.nix"
      "home/eweishaar/common/optional/desktop/tui.nix"
    ]
    ++ (userlib.scanPaths ./.)
  );
  home = {
    packages = with pkgs; [
      brave
      discord
      feh
      grim
      kolourpaint
      obsidian
      python3
      slurp
      spotify
      swappy
      xfce.thunar
      zathura
    ];
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.vimix-cursors;
      name = "Vimix-cursors";
      size = 22;
    };
  };
  gtk = {
    enable = true;
    theme = {
      name = "Tokyonight-Dark-hdpi";
      package = pkgs.tokyonight-gtk-theme;
    };
    iconTheme = {
      name = "Vimix-Amethyst-dark";
      package = pkgs.vimix-icon-theme;
    };
  };
}
