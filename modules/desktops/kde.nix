{ self, inputs, ... }: {
  flake.nixosModules.kdeDesktop = { config, pkgs, lib, ... }: {
    # KDE Plasma Desktop Environment.
    services.desktopManager.plasma6.enable = true;

    # Avoid conflict with GNOME's seahorse for SSH askpass.
    programs.ssh.askPassword = lib.mkForce "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
  };
}
