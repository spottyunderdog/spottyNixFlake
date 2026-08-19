{ self, inputs, ... }: {

  flake.nixosModules.virtualization = { pkgs, lib, config, ... }: {
    imports = [
      self.nixosModules.vmwareVMs
    ];

    vmwareVMs.enable = lib.mkDefault false;

  };

}
