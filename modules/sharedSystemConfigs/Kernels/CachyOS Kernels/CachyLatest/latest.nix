{ self, inputs, ... }: {
  flake.nixosModules.cachyLatest = { pkgs, config, lib, ... }: {
    options = {
      cachyLatestKernel.enable = lib.mkEnableOption "Enables Latest CachyOS Kernel";
    };
    config = lib.mkIf config.cachyLatestKernel.enable {
      boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
    };
    imports = [
      nixosModules.cachyLatest-x86v3
    ];
    # Architechture Versions, Only enable if your know what your doing
    cachyLatest-x86v3Kernel.enable = lib.mkDefault false;
  };
}
