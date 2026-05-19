{
  description = "Configuration NixOS sécurisée et moderne pour Laptop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    securix.url = "github:cloud-gouv/securix";
    securix.flake = false;
  };

  outputs = { self, nixpkgs, disko, home-manager, securix, ... }@inputs: {
    nixosConfigurations = {
      
      # 1. Cible pour votre VRAI laptop
      nix-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          
          # 🛑 DESACTIVATION TEMPORAIRE SÉCURIX
          # "${securix}/modules/default.nix"

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixos = import ./home/home.nix;
          }
          ./disko-config.nix
          ./configuration.nix
          
          # 🛑 DESACTIVATION TEMPORAIRE DU CONFIG DE SÉCURITÉ STRICTE
          # ./security.nix

          { hardware.enableRedistributableFirmware = true; } 
        ];
      };

      # 2. Cible dédiée aux tests QEMU
      nix-vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          
          # 🛑 DESACTIVATION TEMPORAIRE SÉCURIX
          # "${securix}/modules/default.nix"

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixos = import ./home/home.nix;
          }
          ./disko-config.nix
          ./configuration.nix
          
          # 🛑 DESACTIVATION TEMPORAIRE DU CONFIG DE SÉCURITÉ STRICTE
          # ./security.nix

          ({ modulesPath, ... }: {
            imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
          })
        ];
      };

    };
  };
}