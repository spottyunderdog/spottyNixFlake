{ self, inputs, ... }: {

  flake.nixosModules.virtualizationApps = { config, pkgs, lib, ... }: {

    options = {
      virtualizationApps.enable = lib.mkEnableOption "enables virtualizationApps"
    };

    config = lib.mkIf config.virtualizationApps.enable {
      environment.systemPackages = with pkgs; [
        # Virtual Apps
      ];
    };

  };


}