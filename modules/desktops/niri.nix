{ self, inputs, ... }: {
  flake.nixosModules.niriDesktop = { config, pkgs, lib, ... }: {
    # Niri scrollable tiling compositor.
    programs.niri.enable = true;

    # Useful companion packages.
    environment.systemPackages = with pkgs; [
      brightnessctl
      fuzzel
      mako
      swaylock
      waybar
      wl-clipboard
    ];
  };

  perSystem = { pkgs, ... }: {
    packages.myNiri = pkgs.writeShellScriptBin "myNiri" ''
      exec ${pkgs.niri}/bin/niri -c ${../../home/gui-apps/niri/config.kdl} "$@"
    '';
  };
}
