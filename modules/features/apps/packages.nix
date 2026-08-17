{ self, inputs, ... }: {
  flake.nixosModules.packages = { pkgs, lib, config, ... }: {
    imports = [
      self.nixosModules.gamingApps
      self.nixosModules.devApps
      self.nixosModules.mediaApps
      self.nixosModules.remoteAccesApps
    ];
    
    gamingApps.enable = lib.mkDefault false;
    devApps.enable = lib.mkDefault false;
    mediaApps.enable = lib.mkDefault true;
    remoteAccesApps.enable = lib.mkDefault false;

  };
}
