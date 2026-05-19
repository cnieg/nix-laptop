{ pkgs, ... }: {
  home.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };

  home.packages = with pkgs; [
    jetbrains.idea-community
    temurin-bin-21
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
