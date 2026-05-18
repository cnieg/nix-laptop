{ pkgs, ... }: {
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  # Forcer le support Wayland pour IntelliJ et les applications Java
  home.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
    NIXOS_OZONE_HWACCEL = "1"; # Accélération matérielle pour Chromium/Electron
  };

  # Installation des applications utilisateur
  home.packages = with pkgs; [
    jetbrains.idea-community
    temurin-bin-21
    passbolt-cli
  ];

  # Configuration Firefox avec extension Passbolt forcée (Conformité Sécurix)
  programs.firefox = {
    enable = true;
    policies = {
      ExtensionSettings = {
        "passbolt@nautilus.email" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/passbolt/latest.xpi";
        };
      };
      DisableTelemetry = true;
      OfferToSaveLogins = false; # On délègue entièrement à Passbolt
    };
  };

  # Environnement de dev sécurisé et automatique
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
