{ self, inputs, ... }: {
  flake.nixosModules.homeManager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "hm-backup";
      extraSpecialArgs = { inherit inputs self; };
      users.tmayet = import ../../home;
    };
  };
}
