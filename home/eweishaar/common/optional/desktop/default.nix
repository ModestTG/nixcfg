{
  userlib,
  pkgs,
  pkgs-stable,
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
      (flameshot.override { enableWlrSupport = true; })
      handbrake
      jellyfin-media-player
      kolourpaint
      libreoffice
      makemkv
      obsidian
      python3
      spotify
      swappy
      vesktop
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
      name = "Tokyonight-Dark-B-LB";
      package = pkgs-stable.tokyonight-gtk-theme;
    };
    iconTheme = {
      name = "Tokyonight-Dark";
      package = pkgs-stable.tokyonight-gtk-theme;
    };
  };
}
