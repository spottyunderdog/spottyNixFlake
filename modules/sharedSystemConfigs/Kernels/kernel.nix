{ self, inputs, ... }: {
  flake.nixosModules.kernel = { pkgs, config, lib, ... }: {
    nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];
    nix.settings.substituters = [ "https://attic.xuyh0120.win/lantian" ];
    nix.settings.trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];

    imports = [
      self.nixosModules.cachyKernels
    ];
    # Cachy LTS Kernel Default
    cachyLtsKernel.enable = lib.mkDefault false;
    # Cachy Latest Kernel Default
    cachyLatestKernel.enable = lib.mkDefault false;
    # Cachy Hardened Kernel Default
    cachyHardenedKernel.enable = lib.mkDefault false;
    # Cachy Server Kernel
    cachyServerKernel.enable = lib.mkDefault false;

  };
}
