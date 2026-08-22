{ self, inputs, ... }: {
  flake.nixosModules.cachyLatest = { pkgs, config, lib, ... }: {
    options = {
      cachyLatestKernel.enable = lib.mkEnableOption "Enables Latest CachyOS Kernel";
    };
    config = lib.mkIf config.cachyLatestKernel.enable {
      boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
    };
    imports = [
      self.nixosModules.cachyLatest-x86v3
    ];

  };
}
