{ self, inputs, ... }: {
  flake.homeModules.zed = { config, pkgs, lib, ... }: {
    options = {
      zedConfig.enable libMkEnableOption "enables zed-ediotr config"
    };

    config = lib.mkIf config.zedConfig.enable {
      programs.zed-editor = {
        mutableUserSettings = true;
        extensions = [
          "nix"
          "toml"
          "java"
        ];
      };
    };
  };
}
