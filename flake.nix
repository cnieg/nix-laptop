outputs = { self, nixpkgs, disko, securix, home-manager, ... }: {
  nixosConfigurations = {
    
    # 1. La cible pour votre VRAI laptop
    nix-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        securix.nixosModules.default
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nixos = import ./home.nix;
        }
        ./disko-config.nix
        ./configuration.nix
        ./security.nix
        # On peut ajouter ici des options spécifiques au hardware réel (ex: firmware)
        { hardware.enableRedistributableFirmware = true; } 
      ];
    };

    # 2. La cible dédiée aux tests QEMU
    nix-vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        securix.nixosModules.default
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nixos = import ./home.nix;
        }
        ./disko-config.nix
        ./configuration.nix
        ./security.nix
        
        # L'import QEMU est injecté UNIQUEMENT ici !
        ({ modulesPath, ... }: {
          imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
        })
      ];
    };

  };
};
