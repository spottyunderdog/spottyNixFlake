{ config, pkgs, home-manager,... }: {
    imports = [
      #app config files
    ];
    home.username = "spotty";
    home.stateVersion="26.05";
    home.directory = "/home/spotty";
}
