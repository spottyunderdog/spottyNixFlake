{ self, inputs, ... }: {
  flake.homeModules.appConfigs = { pkgs, lib, config, ... }: {
    imports = {
      # Home Manager app Config files
      self.homeModules.zed
    }
    zedConfig.enable = lib.mkDefault false;
  };
}
