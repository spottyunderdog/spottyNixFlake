{ self, inputs, ... }: {
  flake.nixosModules.cachyLts = { pkgs, config, lib, ... }: {
    options = {
      cachyLtsKernel.enable = lib.mkEnableOption "Enable Cachos LTS Kernel";
    };

    config = lib.mkIf config.cachyLtsKernel.enable {
      boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-lts;
    };

  };
}
