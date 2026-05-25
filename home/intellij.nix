{ pkgs, ... }: {
  home.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };

  home.packages = with pkgs; [
    jetbrains.idea-oss
    temurin-bin-21
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.bash.shellAliases = {
    idea = "idea-community";
    intellij = "idea-community";
  };
}

