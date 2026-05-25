{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Vos paquets KDE ici
  ];

  home.file = {
    # 🔢 Forcer l'activation du Num Lock dès l'ouverture de la session Plasma
    ".config/kcminputrc" = {
      text = ''
        [Keyboard]
        NumLock=0
      '';
      force = true; # 🔥 Indique à Home Manager qu'il a le droit d'écraser le fichier existant
    };
  };
}
