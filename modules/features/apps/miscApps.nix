{ self, inputs, ... }: {

  flake.nixosModules.miscApps = { config, pkgs, lib, ... }: {
    
    options = {
      miscApps.enable = lib.mkEnableOption "enables miscApps";
    };
    
    config = lib.mkIf config.miscApps.enable {
      environment.systemPackages = with pkgs; [
        obsidian
        protonmail-desktop
        proton-pass
        proton-vpn
        firefox
        vivaldi
        vivaldi-ffmpeg-codecs
      ];
    };


   };

}
