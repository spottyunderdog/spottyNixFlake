{ self, inputs, ... }: {
  flake.nixosModules.cachyServer { pkgs, config, ... }: {
    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-hardened;
  };
}
