{ self, inputs, ... }: {

  flake.nixosModules.mediaApps = { config, pkgs, lib, ... }: {

    options = {
      mediaApps.enable = lib.mkEnableOption "enables mediaApps";
    };

    config = lib.mkIf config.mediaApps.enable {

      environment.systemPackages = with pkgs; [

        jellyfin-desktop
        kdePackages.kdenlive
        mkvtoolnix
        mkvtoolnix-cli
        obs-studio
        handbrake
        vlc
        subtitleedit
        spotify

      ];

    };

  };

}
