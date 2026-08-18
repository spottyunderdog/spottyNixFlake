{ self, inputs, ... }: {
  flake.homeModule.zed = { pkgs, ... }: {
    programs.zed-editor = {
      extensions = [ "nix" "toml" "rust" ];
      userSettings = {
        theme = {
          mode = "dark";
        };
        hour_format = "hour24";
        vim_mode = false;
      };
    };
  };
}
