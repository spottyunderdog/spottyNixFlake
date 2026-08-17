{ self, inputs, ... }: {

  flake.nixosModules.devApps = { config, pkgs, lib, ... }: {

    options = {
      devApps.enable = lib.mkEnableOption "enables devApps";
    };
    
    config = lib.mkIf config.devApps.enable {

      environment.systemPackages = with pkgs; [
        git
	eclipses.eclipse-java
        vscode
	zed-editor
	cmake
	meld
      ];

    };

  };

}
