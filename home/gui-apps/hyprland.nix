{ pkgs, ... }:
{
  home.packages = [ pkgs.nwg-displays pkgs.hyprland-qtutils ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland-defaults.conf;
    settings = {
      exec-once = [
        "caelestia-shell"
      ];
    };
  };
}
