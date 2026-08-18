{ self, inputs, ... }: {
  flake.nixosModules.homeManager = { home-manager, inputs, config, nixpkgs, ... } : {
    imports = [
      inputs.home-manager.flakeModules.home-manager
    ];
    homeModules.bash = { pkgs, ...}: {
      programs.bash = {
        enable = true;
        shellAlisases = {
          ll = "ls -l";
        };
      };
    };
    homeConfigurations."spotty" = home-manager.lib.homeManager.Configuration {
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      modules = [
        inputs.self.homeModules.bash
        {
          home.username = "spotty";
          home.homeDirectory = "/home/spotty";
          home.stateVersion = "26.05";
        }
      ];
    };
  };
}
