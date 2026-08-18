{ self, inputs, ... }: {
  flakes.nixosModules.bootLoader = { pkgs, config, ... }: {
    boot.loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
