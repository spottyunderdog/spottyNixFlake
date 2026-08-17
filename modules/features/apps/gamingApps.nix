{ self, inputs, ... }: {

  flake.nixosModules.gamingApps = { config, pkgs, lib, ... }: {
    
    options = {
      gamingApps.enable = lib.mkEnableOption "enables gamingApps";
    };
    
    config = lib.mkIf config.gamingApps.enable {
      environment.systemPackages = with pkgs; [
        goverlay
        heroic
        prismlauncher
        protonplus
        protontricks
        r2modman
        steam
        winetricks
        lutris
      ];
    };


   };

}
