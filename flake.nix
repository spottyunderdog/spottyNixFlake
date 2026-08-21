{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake{inherit inputs;} (
    { ... }: {
      imports = [ (inputs.import-tree ./modules) ];
      flake = {
          nixosModules.default = { pkgs, ... }: {
          nixpkgs.overlays = [
            inputs.nix-cachyos-kernel.overlays.pinned
          ];
        };
      };
    }
  );
}
