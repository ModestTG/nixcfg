{
  userlib,
  pkgs,
  ...
}:

let
  tokyonight-gtk-icon-theme = pkgs.tokyonight-gtk-theme.override {
    iconVariants = [ "Dark" ];
  };
in
{
  imports = (
    map userlib.relativeToRoot [
      "home/eweishaar/common/optional/desktop/sway"
      "home/eweishaar/common/optional/desktop/ghostty.nix"
    ]
    ++ (userlib.scanPaths ./.)
  );
  home = {
    packages = with pkgs; [
      brave
      discord
      feh
      (flameshot.override { enableWlrSupport = true; })
      ghostty
      handbrake
      immich-go
      jellyfin-media-player
      kolourpaint
      libreoffice
      makemkv
      obsidian
      python3
      qflipper
      spotify
      swappy
      vesktop
      wireshark
      xfce.thunar
      yt-dlp
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
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };
    iconTheme = {
      name = "Tokyonight-Dark";
      package = tokyonight-gtk-icon-theme;
    };
  };
}
