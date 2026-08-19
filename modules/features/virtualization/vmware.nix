{ self, inputs, ... }: {

  flake.nixosModules.vmwareVMs = { pkgs, lib, config, ... }: {
    options = {
      vmwareVMs.enable = lib.mkEnableOption "enables VMWare Workstation, & virtualization";
    };

    config = lib.mkIf vmwareVms.enable {
       virtualisation.vmware.host.enable = true;
       environment.systemPackages = with pkgs; [
         vmware-workstation
       ];
    };
  };
}
