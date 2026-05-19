{ ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      input = {
        kb_layout = "fr"; # Clavier AZERTY pour Hyprland
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
