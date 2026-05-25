{ pkgs, ... }: {
  # ============================================================================
  # 1. AMORÇAGE & SYSTÈME DE FICHIERS (Boot & Storage)
  # ============================================================================
  
  # Utilisation de systemd-boot pour l'UEFI
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Support de Btrfs au démarrage (indispensable pour votre schéma Disko)
  boot.supportedFilesystems = [ "btrfs" ];
  
  # Optimisation pour la durée de vie de votre SSD (Trim à travers LUKS)
  services.fstrim.enable = true;

  # ============================================================================
  # 2. LOCALISATION & HORLOGE (Time & Internationalization)
  # ============================================================================
  
  # Fuseau horaire de Paris & synchronisation réseau automatique
  time.timeZone = "Europe/Paris";
  services.chrony.enable = true; 
  
  # Si vous êtes en dual-boot avec Windows, décommentez la ligne suivante :
  # time.hardwareClockInLocalTime = true;

  # Paramètres linguistiques globaux
  i18n.defaultLocale = "fr_FR.UTF-8";
  
  # Configuration stricte de la console TTY en AZERTY (avec fontes adaptées)
  console = {
    enable = true;
    # keyMap = "fr";
    font = "Lat2-Terminus16"; 
    useXkbConfig = true; # Copie les règles XKB définies plus bas
  };

  # Configuration de base d'XKB (utilisée par SDDM et les bureaux Wayland)
  services.xserver = {
    enable = true;
    xkb = {
      layout = "fr";
      variant = ""; # Le TTY et SDDM restent en AZERTY classique
    };
  };

  # ============================================================================
  # 3. RÉSEAU (Networking)
  # ============================================================================
  
  # Nom de la machine (aligné avec votre cible de Flake)
  networking.hostName = "nix-laptop";
  networking.networkmanager.enable = true;
  
  # ============================================================================
  # 4. UTILISATEURS & SÉCURITÉ (Users & Base Permissions)
  # ============================================================================
  
  users.users.nixos = {
    isNormalUser = true;
    # "wheel" réactive l'usage de sudo suite au retrait temporaire de Sécurix
    extraGroups = [ "wheel" "video" "networkmanager" ];
    initialPassword = "nixos"; 
  };

  # ============================================================================
  # 5. ENVIRONNEMENTS GRAPHIQUES (Display & Desktop Managers)
  # ============================================================================
  
  # Gestionnaire de connexion SDDM (compatible Wayland)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoNumlock = true;
  };
  # Vos 4444vironnements disponibles au choix sur l'écran d'accueil :
  services.desktopManager.plasma6.enable = true;
  services.desktopManager.cosmic.enable = true;
  programs.hyprland.enable = true;
  programs.niri.enable = true;

  # ============================================================================
  # 6. PARAMÈTRES NIX & PARAMÈTRES INTERNES (Nix Core Settings)
  # ============================================================================
  
  # Activation des fonctionnalités modernes de Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    git
  ];

  # Configuration globale de Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true; # Définit nvim comme l'éditeur par défaut du système ($EDITOR)
    viAlias = true;       # Crée l'alias : vi -> nvim
    vimAlias = true;      # Crée l'alias : vim -> nvim
  };

  # Version d'installation initiale (ne jamais modifier pour garantir la reproductibilité)
  system.stateVersion = "25.11";
}
