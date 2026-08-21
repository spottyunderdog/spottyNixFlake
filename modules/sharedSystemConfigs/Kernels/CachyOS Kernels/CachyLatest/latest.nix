{ self, inputs, ... }: {
  flake.nixosModules.cachyLatest { pkgs, config, ... }: {
    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
  };
}
