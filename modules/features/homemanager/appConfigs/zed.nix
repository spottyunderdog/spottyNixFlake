{ self, inputs, ... }: {
  flake.homeModules.zed = { config, pkgs, ... }: {
    programs.zed-editor = {
      mutableUserSettings = true;
      extensions = [
        "nix"
        "toml"
        "java"
      ];
    };
  };
}
