{ pkgs, ... }: {
  # ============================================================================
  # 1. PAQUETS SPÉCIFIQUES À L'ENVIRONNEMENT KDE PLASMA
  # ============================================================================
  home.packages = with pkgs; [
    # Vous pouvez ajouter ici des utilitaires spécifiques à KDE si nécessaire
    # (Exemple : kdePackages.spectacle pour les captures d'écran)
  ];

  # ============================================================================
  # 2. CONFIGURATIONS DES FICHIERS DE SESSION (Dotfiles KDE)
  # ============================================================================
  home.file = {
    # 🔢 Forcer l'activation du Num Lock dès l'ouverture de la session Plasma
    # (Dans les fichiers de config KDE, la valeur "0" signifie "Allumé par défaut")
    ".config/kcminputrc".text = ''
      [Keyboard]
      NumLock=0
    '';
    force = true;
    # Exemple optionnel : Vous pouvez ajouter d'autres configurations ici plus tard
    # ".config/kdeglobals".text = '' ... '';
  };
}
