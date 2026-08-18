{ self, inputs, ... }: {
  flake.homeModules.zed = { config, pkgs, lib, ... }: {
    options = {
      zedConfig.enable = lib.mkEnableOption "enables zed-ediotr config";
    };

    config = lib.mkIf config.zedConfig.enable {
      programs.zed-editor = {
        mutableUserSettings = true;
        extensions = [ "nix" "toml" "java" "lua" "latex" "catppuccin" "dracula" "catppuccin icons" ];
        show_whitespaces = "all";
        base_keymap = "VSCode";
        hour_format = "hour24";
        vim_mode = false;
        theme = {
          mode = "dark";
          dark = "Dracula";
          light = "Ayu Mirage";
        };
        icon_theme = "Catppuccin Mocha";
      };
    };
  };
}
