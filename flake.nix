{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";

    qylock = {
      url = "github:Darkkal44/qylock";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvim-conf = {
      url = "github:MaugrimEP/nvim-conf";
      flake = false;
    };
  };

  # import modules/ automatically
  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);
}
