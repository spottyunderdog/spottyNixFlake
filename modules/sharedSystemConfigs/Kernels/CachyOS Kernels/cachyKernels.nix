{ self, inputs, ... }: {
  flake.nixosModules.cachyKernels = { pkgs, config, lib, ... }: {
    imports = [
      self.nixosModules.cachyLatest
      self.nixosModules.cachyLts
      self.nixosModules.cachyServer
      self.nixosModules.cachyHardened
    ];
    # Architechture Versions, Only enable if your know what your doing
    cachyLatest-x86v3Kernel.enable = lib.mkDefault false;
  };
}
