{ pkgs, ... }: {
  home.packages = [ pkgs.kitty ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # C'est ce bloc qui force l'AZERTY dans Hyprland
      input = {
        kb_layout = "fr";
        kb_variant = "oss"; # Options: "oss" (recommandé) ou "" (standard)
        follow_mouse = 1;
      };
      
      "$mod" = "SUPER";
      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, Q, killactive"
        "$mod, F, exec, firefox"
      ];
    };
  };
}
