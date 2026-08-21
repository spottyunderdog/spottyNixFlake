{ self, inputs, ... }: {
  flake.nixosModules.cachyLatest = { pkgs, config, ... }: {
    options = {
      cachyLatestKernel.enable = lib.mkEnableOption "Enables Latest CachyOS Kernel";
    };
    config = lib.mkIf config.cachyLatestKernel.enable {
      boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
    };
  };
}
