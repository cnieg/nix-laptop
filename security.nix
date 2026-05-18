{ pkgs, ... }: {
  # Activation de la politique ANSSI Sécurix (DINUM)
  securix.anssi.enable = true;

  # Utilisation du noyau durci Linux officiel
  boot.kernelPackages = pkgs.linuxPackages_hardened;

  # Règles réseaux de base et pare-feu strict
  networking.firewall.enable = true;
  networking.firewall.allowPing = false;

  # Remplacement de Sudo par Doas (plus minimaliste et sécurisé)
  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [{
      users = [ "nixos" ];
      keepEnv = true;
      persist = true;
    }];
  };
}
