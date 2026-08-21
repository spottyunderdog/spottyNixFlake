{ self, inputs, ... }: {
  flake.nixosModules.packages = { pkgs, lib, config, ... }: {
    imports = [
      self.nixosModules.devApps
      self.nixosModules.gamingApps
      self.nixosModules.mediaApps
      self.nixosModules.miscApps
      self.nixosModules.remoteAccessApps
      self.nixosModules.utilityApps
    ];

    devApps.enable = lib.mkDefault false;
    gamingApps.enable = lib.mkDefault false;
    mediaApps.enable = lib.mkDefault true;
    miscApps.enable = lib.mkDefault true;
    remoteAccessApps.enable = lib.mkDefault false;
    utilityApps.enable = lib.mkDefault true;

  };
}
