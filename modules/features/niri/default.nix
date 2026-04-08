{ self, inputs, ... }:
{
  flake.nixosModules.niriDesktop =
    { pkgs, ... }:
    {
      programs.niri.enable = true;

      home-manager.users.tmayet = {
        xdg.configFile."niri/config.kdl".source = ./config.kdl;
        home.packages = [
          self.packages.${pkgs.stdenv.hostPlatform.system}.myNoctalia
        ];
      };
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.myNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
        inherit pkgs;
        settings = builtins.fromJSON (builtins.readFile ../noctalia/settings.json);
      };
    };
}
