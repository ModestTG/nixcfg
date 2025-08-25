{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.nixosModule.desktop.audio;
in
{
  options.nixosModule.desktop.audio = {
    enable = lib.mkEnableOption "enables Pipewire audio";
  };

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
