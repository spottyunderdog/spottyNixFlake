{ self, inputs, ... }: {
  flake.nixosModules.cachyLatest-x86v3 = { pkgs, config, lib, ... }: {
    options = {
      cachyLatest-x86v3Kernel.enable = lib.mkEnableOption "Enables Latest CachyOS Kernel";
    };
    config = lib.mkIf config.cachyLatestKernel.enable {
      boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-x86v3;
    };
  };
}
