{ self, inputs, ... }: {
  flake.nixosModules.packages = { pkgs, lib, config, ... }: {
    imports = [
      self.nixosModules.devApps
      self.nixosModules.gamingApps
      self.nixosModules.mediaApps
      self.nixosModules.miscApps
      self.nixosModules.remoteAccesApps
      self.nixosModules.utilityApps
      self.nixosModules.virtualizationApps
    ];

    devApps.enable = lib.mkDefault true;
    gamingApps.enable = lib.mkDefault false;
    mediaApps.enable = lib.mkDefault true;
    miscApps.enable = lib.mkDefault true;
    remoteAccesApps.enable = lib.mkDefault false;
    utilityApps.enable = lib.mkDefault true;
    virtualizationApps.enable = lib.mkDefault false;


  };
}
