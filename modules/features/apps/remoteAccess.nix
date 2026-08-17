{ self, inputs, ... }: {

  flake.nixosmodules.remoteAccesApps = { config, pkgs, lib, ... }: {
    
    options = {

      remoteAccesApps.enable = lib.mkEnableOption "enable remoteAccesApps";

    };

    config = lib.mkIf config.remoteAccesApps.enable {

      environment.systemPackages = with pkgs; [

        rustdesk
        sunshine
        moonlight-qt
        tailscale
        trayscale

      ];

    };

  };

}
