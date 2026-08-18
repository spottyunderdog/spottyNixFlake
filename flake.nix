{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = inputs@{
    flake-parts,
    home-manager,
    nixpkgs,
    ...
  }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        (inputs.import-tree ./modules)
        inputs.home-manager.flakeModules.home-manager
      ];
      flake = {
        homeModule.myConfs = import ./modules/features/homemanager/homemanager.nix;
      };
    };
}
