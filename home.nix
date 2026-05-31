{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Dmytro Anyduck";
        email = "dmytro.anyduck@gmail.com";
      };
    };
    ignores = [
      ".direnv"
      ".envrc"
    ];
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true; # see note on other shells below
    nix-direnv.enable = true;
  };

  programs.bash.enable = true;

  home.file.".config/VSCodium/product.json".text = builtins.toJSON {
    extensionsGallery = {
      serviceUrl = "https://marketplace.visualstudio.com/_apis/public/gallery";
      cacheUrl = "https://vscode.blob.core.windows.net/gallery/index";
      itemUrl = "https://marketplace.visualstudio.com/items";
    };
  };
  home.file.".vscode-oss/argv.json".text = builtins.toJSON {
    enable-crash-reporter = false;
    crash-reporter-id = "00000000-0000-0000-0000-000000000000";
    password-store = "gnome-libsecret"; # vscode isn't detecting gnome-keyring automatically
  };
}
