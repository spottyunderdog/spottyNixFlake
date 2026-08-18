{ self, inputs, ... }: {
  flake.homeConfigurations.spotty = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs { system = "x86_64-linux"; };
    modules = [
      inputs.self.homeModules.zed
      {
        home.username = "spotty";
        home.homeDirectory = "/home/spotty"
        home.stateVersion = "26.05"
      }
    ];
  };
}
