{ pkgs, ... }:
{
  home.packages = [ pkgs.nwg-displays pkgs.hyprland-qtutils ];

  xdg.configFile."hypr/keybinds.conf".source = ./keybinds.conf;

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
    settings = {
      exec-once = [
        "caelestia-shell"
      ];
    };
  };
}
