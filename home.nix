{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
  };

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

  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        mkhl.direnv

        # github.copilot-chat

        rust-lang.rust-analyzer
        tombi-toml.tombi
        fill-labs.dependi
      ];
      userSettings = {
        "telemetry.feedback.enabled" = false;
        "telemetry.telemetryLevel" = "off";
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmPasteNative" = false;
      };
    };
    argvSettings = {
      enable-crash-reporter = false;
      password-store = "gnome-libsecret";
    };
  };
}
