{ self, inputs, ... }: {
  flake.nixosModules.gnomeDesktop = { config, pkgs, lib, ... }: {
    # Display manager (shared — GDM handles session selection for all desktops).
    services.displayManager.gdm.enable = true;

    # X11 (needed by GDM even for Wayland sessions).
    services.xserver.enable = true;

    # GNOME Desktop Environment.
    services.desktopManager.gnome.enable = true;

    # Disable GCR's SSH agent — we use home-manager's ssh-agent instead.
    services.gnome.gcr-ssh-agent.enable = false;

    # Hint Electron apps to use Wayland.
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
