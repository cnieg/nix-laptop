{ pkgs, ... }: {
  # On garde le fichier actif et propre sans forcer de définitions instables
  home.packages = with pkgs; [
    # Vous pourrez ajouter ici des applets COSMIC ou des polices plus tard
  ];

  # Astuce : COSMIC Desktop stocke nativement ses configurations de Tiling 
  # et de raccourcis dans ~/.config/cosmic/. 
  # Il est plus sûr de les configurer via l'application "Settings" de COSMIC
  # pour éviter les erreurs de syntaxe Nix lors des mises à jour.
}
