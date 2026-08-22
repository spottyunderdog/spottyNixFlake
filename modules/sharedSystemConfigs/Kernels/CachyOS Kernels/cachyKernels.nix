{ self, inputs, ... }: {
  flake.nixosModules.cachyKernels = { pkgs, config, lib, ... }: {
    imports = [
      self.nixosModules.cachyLatest
      self.nixosModules.cachyLts
      self.nixosModules.cachyServer
      self.nixosModules.cachyHardened
    ];
    # Defaults For CachyOS Linux Kernel Latest. Architechture Specific version.
    # If You don't know which version you should use, don't enable them
    # Just use the "cachyOS latest" kernel option it provides all variants.
    # I recommend reading the Cachy OS Wiki if you are interested,
    # The bellow artcile can help you figure out what one to use.
    # Read: https://wiki.cachyos.org/features/optimized_repos/
    cachyLatestKernel-x86v3.enable = lib.mkDefault false;
    cachyLatestKernel-x86v4.enable = lib.mkDefault false;
    cachyLatestKernel-zen4.enable = lib.mkDefault false; # Note: Works on both Zen 4 and Zen 5 CPUS
  };
}
