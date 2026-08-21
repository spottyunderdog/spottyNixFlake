{ self, inputs, ... }: {
  flake.nixosModules.cachyLts { pkgs, config, ... }: {
    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-lts;
  };
}
