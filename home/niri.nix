{ pkgs, ... }: {
  # Optionnel : Ajoutez des outils spécifiques à niri ici si besoin (comme xwayland-satellite)
  home.packages = with pkgs; [
    swaybg # Pour gérer le fond d'écran sur Niri
    waybar # Si vous voulez une barre de statut
  ];

  # Génération déclarative de la configuration de Niri
  xdg.configFile."niri/config.kdl".text = ''
    // ⌨️ Configuration du clavier en AZERTY
    input {
        keyboard {
            xkb {
                layout "fr"
                variant "oss"
            }
            // 🔢 Activation du Num Lock au démarrage
            track-layout-changes
            numlock-by-default
        }
        touchpad {
            tap
            natural-scroll
        }
    }

    // Configuration des sorties (écrans)
    output "eDP-1" {
        scale 1.0
    }

    // Quelques raccourcis de base pour ne pas être bloqué
    binds {
        // Mod+Maj+E pour quitter Niri
        Mod+Shift+E { quit; }
        
        // Mod+T pour ouvrir ton terminal (remplace kitty par ton terminal actuel)
        Mod+T { spawn "kitty"; }
        
        // Raccourcis de navigation classiques de Niri
        Mod+Left  { focus-column-left; }
        Mod+Right { focus-column-right; }
        Mod+Up    { focus-window-or-monitor-up; }
        Mod+Down  { focus-window-or-monitor-down; }
        
        Mod+Ctrl+Left  { move-column-left; }
        Mod+Ctrl+Right { move-column-right; }
    }
  '';
}

