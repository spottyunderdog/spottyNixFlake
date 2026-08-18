{ config, pkgs, home-manager, self,... }: {
    imports = [
      #app config files
      self.homeModules.zed
    ];
}
