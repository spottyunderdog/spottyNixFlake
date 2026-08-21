{ self, inputs, ... }: {
  flake.nixosModules.cachyKernels = { pkgs, config, lib, ... }: {
    imports = [
      self.nixosModules.cachyLatest
      self.nixosModules.cachyLts
      self.nixosModules.cachyServer
      self.nixosModules.cachyHardened
    ];

  };
}
