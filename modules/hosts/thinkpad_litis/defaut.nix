{ self, inputs, ... }: {
  flake.nixosConfigurations.thinkpad_litis = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.thinkpad_litisConfiguration
      self.nixosModules.homeManager
    ];
  };
}
