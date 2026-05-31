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
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.bash.enable = true;

  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium-fhs;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        github.copilot-chat
        rust-lang.rust-analyzer
      ];
    };
    argvSettings = {
      enable-crash-reporter = false;
      password-store = "gnome-libsecret";
    };
  };
}
