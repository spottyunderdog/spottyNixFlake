{ self, inputs, ... }: {
  flake.nixosModules.kernel = { pkgs, config, ... }: {
    nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];
    nix.settings.substituters = [ "https://attic.xuyh0120.win/lantian" ];
    nix.settings.trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];

    import = [
      self.nixosModules.cachyLts
    ];
    #Add -x86_64-v3, -x86_64-v4, or -zen4 Depending on your CPU's architrchture
    # If you don't no wich omit the artitecture flage from the kernel specification.
    # See https://github.com/xddxdd/nix-cachyos-kernel for more options
    # boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-zen4;
    # boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-lts;
    # boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-hardened;
    # boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-server;
  };
}
