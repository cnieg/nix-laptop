# 💻 NixOS Laptop Configuration (25.11)

Ce dépôt contient la configuration déclarative, moderne et durcie de mon ordinateur portable sous NixOS.

## 🛠️ Stack Technique

*   **Gestion des paquets :** Nix Flakes (Branche `25.11`)
*   **Architecture Disque :** `disko` — Partitionnement GPT, Chiffrement total **LUKS** et système de fichiers **Btrfs** avec sous-volumes (`@`, `@home`, `@nix`) compressés en `zstd`.
*   **Sécurité :** `securix` (DINUM / État Français) — Profil de durcissement aligné sur les recommandations **ANSSI** (Kernel hardened, restrictions d'exécution, auditd, pare-feu strict et remplacement de `sudo` par `doas`).
*   **Gestion Utilisateur :** `home-manager` — Isolation complète de l'environnement utilisateur.
*   **Environnements Graphiques :** Triple-boot graphique au choix sur l'écran d'accueil (SDDM Wayland) :
    *   **KDE Plasma 6** (Stable & complet)
    *   **COSMIC Desktop** (Moderne, écrit en Rust)
    *   **Hyprland** (Tiling window manager fluide et dynamique)

## 📦 Outils Pré-configurés (User-Land)

*   **Firefox :** Durci avec déploiement forcé de l'extension de sécurité **Passbolt**.
*   **IntelliJ IDEA :** Injecté avec variables d'environnement pour le support natif de Wayland et couplé à `direnv` pour exécuter des compilations locales sans déclencher les blocages de sécurité de Sécurix.

## 🚀 Tester localement (QEMU)

Vous pouvez tester l'intégralité de cette configuration (les environnements de bureau et les applications) dans une machine virtuelle isolée sans toucher à votre système actuel.

1. Clonez le dépôt :
   ```bash
   git clone [https://github.com/cnieg/nix-laptop.git](https://github.com/cnieg/nix-laptop.git)
   cd nix-laptop
   ```
2. Rendez le script de test exécutable et lancez-le :
   ```bash
   chmod +x run-vm.sh
   ./run-vm.sh
   ```
## 💾 Déploiement Réel (via `nixos-anywhere`)

Pour installer cette configuration sur une machine cible bootée sur une ISO NixOS standard :

1. Sur la machine cible, définissez un mot de passe temporaire : `sudo passwd nixos` et récupérez son IP.
2. Depuis votre machine principale, lancez le déploiement automatisé :
   ```bash
   sudo nix --extra-experimental-features "nix-command flakes" run github:nix-community/nixos-anywhere -- \
     --flake .#nix-laptop \
     nixos@<IP_CIBLE>
   ```
(Le script va vous demander à distance votre Passphrase LUKS pour chiffrer le SSD de la cible).
---

## 🚀 Prochaine étape pour vous ?
Vous pouvez directement copier/coller ces fichiers dans votre espace de travail, faire un `git add .`, puis un `git commit -m "Feat: Integration Disko, Securix, Home-Manager"` et pousser le tout sur votre dépôt officiel `cnieg/nix-laptop` !

