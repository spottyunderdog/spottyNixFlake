{ self, inputs, ... }: {

  flake.nixosModules.utilityApps = { config, pkgs, lib, ... }: {

    options = {
      utilityApps.enable = lib.mkEnableOption "enables utitityApps"
    };

    config = lib.mkIf config.gamingApps.enable {
      nixpkgs.config.permittedInsecurePackages = [
        "electron-40.10.5"
      ];
      environment.systemPackages = with pkgs; [
        bottles
        btop
        btrfs-assistant
        mediawriter
        filezilla
        kdePackages.kcalc
        kdePackages.kdeconnect-kde
        kitty
        mission-center
        openrgb
        qbittorrent
        sublime3
        upscaler
        winboat
        easyeffects
      ];
    };

  };


}