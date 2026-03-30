{ self, inputs, ... }: {
  flake.nixosModules.hyprlandDesktop = { config, pkgs, lib, ... }: {
    # Hyprland compositor.
    programs.hyprland.enable = true;
    programs.hyprland.withUWSM = true;

    # Useful Hyprland ecosystem packages.
    environment.systemPackages = with pkgs; [
      brightnessctl
      hyprlauncher
      hyprlock
      hyprpaper
      hyprshot
    ];
  };
}
