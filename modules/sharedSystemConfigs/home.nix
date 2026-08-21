{ self, inputs, ... }: {

  # This is your standalone home-manager configuration, meant to be used on non-nixos machines
  # with the home-manager command
  flake.homeConfigurations.spotty = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.spottyModule
      {
        home.username = "spotty";
        home.homeDirectory = "/home/spotty";
      }
    ];
  };

  # This is your home.nix, your module where you configure home-manager
  # It's imported both in standalone configuration above, and in your nixos configuration
  flake.homeModules.spottyModule = { pkgs, ... }: {
    imports = [
      self.homeModules.appConfigs
    ];
    zedConfig.enable = true;
    programs.bash.shellAliases.ll = "ls -l";

    home.packages = [ ];
    home.stateVersion = "26.05";
  };

}
