#!/usr/bin/env bash
set -e

echo "🔨 Génération de la machine virtuelle de test (25.11)..."
nix --extra-experimental-features "nix-command flakes" build .#nixosConfigurations.nix-vm.config.system.build.vm
echo "🚀 Lancement de la VM de test avec accélération graphique..."
./result/bin/run-nix-vm -m 4096 -smp 4 -enable-kvm -vga virtio -display sdl,gl=on
