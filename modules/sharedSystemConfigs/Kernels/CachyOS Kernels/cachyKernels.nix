{ self, inputs, ... }: {
  flake.nixosModules.cachyKernels = { pkgs, config, lib, ... }: {
    imports = [
      self.nixosModules.cachyLts
    ];
    # Cachy LTS Kernel Defaults
    cachyLtsKernel.enable = lib.mkDefault false;
  };
}
