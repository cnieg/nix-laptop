{ pkgs, ... }: {
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  imports = [
    ./hyprland.nix
    ./cosmic.nix
    ./plasma.nix
    ./firefox.nix
    ./intellij.nix
    ./git.nix
  ];

  # Clavier en français par défaut pour la session Home Manager
  home.keyboard = {
    layout = "fr";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
