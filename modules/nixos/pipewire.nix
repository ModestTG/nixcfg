{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.ewhsModule.desktop.audio;
in
{
  config = lib.mkIf cfg.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      jack.enable = true;
    };

    environment.systemPackages = with pkgs; [
      pulseaudio
      pamixer
      pavucontrol
    ];
  };
}
