{ pkgs, ... }: {
  # Utilisation de systemd-boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Support de Btrfs au démarrage
  boot.supportedFilesystems = [ "btrfs" ];
  
  # Optionnel mais recommandé pour les SSD sur LUKS
  services.fstrim.enable = true;

  networking.hostName = "nixos-test-vm";
  networking.networkmanager.enable = true;
  
  # Configuration des utilisateurs
  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
    initialPassword = "nixos"; # Mot de passe de session temporaire
  };

  # Activation des environnements graphiques
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.desktopManager.cosmic.enable = true;
  programs.hyprland.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
