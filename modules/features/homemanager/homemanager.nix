{ config, pkgs, ... }: {
    imports = [
      #app config files
    ];

    home.username = "spotty";
    home.directory = "/home/spotty";
    home.stateVersion = "26.05";
}
