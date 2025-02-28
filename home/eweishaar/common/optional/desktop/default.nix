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
      gthumb
      handbrake
      immich-go
      jellyfin-media-player
      kdePackages.kolourpaint
      libreoffice
      makemkv
      mqtt-explorer
      obsidian
      python3
      qflipper
      spotify
      swappy
      vesktop
      wireshark
      xfce.thunar
      xfce.tumbler
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
