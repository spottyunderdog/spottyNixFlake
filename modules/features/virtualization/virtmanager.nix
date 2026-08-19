{ self, inputs, ... }: {

  flake.nixosModules.virtmanagerVMs = { pkgs, lib, config, ... }: {
    options = {
      virtManVMs.enable = lib.mkEnableOption "enables the creation of virt manger vms";
    };

    config = lib.mkIf config.virtManVMs.enable {
      programs.virt-manager.enable = true;
      users.groups.libvirtd.members = ["spotty"];
      virtualisation.libvirtd.enable = true;
      virtualisation.spiceUSBRedirection.enable = true;
    };
  };

}
