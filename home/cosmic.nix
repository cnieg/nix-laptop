{ ... }: {
  # Configuration utilisateur pour COSMIC Desktop
  wayland.windowManager.cosmic = {
    # Note : Le module home-manager pour COSMIC expose la configuration du compositeur
    settings."org.euclid.cosmic-comp" = {
      # Activer le tiling par défaut dès l'ouverture de la session
      autotiling = true;

      # Définir la touche SUPER (Windows) comme modificateur principal
      modifier = "Super";

      # Vos raccourcis clavier pour naviguer entre les tuiles (façon Hyprland / i3)
      bindings = {
        # Déplacer le focus entre les fenêtres (Super + Flèches ou HJKL)
        "FocusLeft" = [ "Super+Left" "Super+h" ];
        "FocusDown" = [ "Super+Down" "Super+j" ];
        "FocusUp" = [ "Super+Up" "Super+k" ];
        "FocusRight" = [ "Super+Right" "Super+l" ];

        # Déplacer physiquement la fenêtre dans la grille
        "MoveLeft" = [ "Super+Shift+Left" "Super+Shift+h" ];
        "MoveDown" = [ "Super+Shift+Down" "Super+Shift+j" ];
        "MoveUp" = [ "Super+Shift+Up" "Super+Shift+k" ];
        "MoveRight" = [ "Super+Shift+Right" "Super+Shift+l" ];

        # Basculer une fenêtre en mode plein écran (Fullscreen) ou flottant
        "ToggleFullscreen" = [ "Super+f" ];
        "ToggleFloating" = [ "Super+Shift+g" ];
      };
    };
  };
}