{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "caelestia-shell"
      ];
      bind = [
        "SUPER, F, fullscreen, 1"
      ];
    };
  };
}
