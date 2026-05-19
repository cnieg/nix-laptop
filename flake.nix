outputs = { self, nixpkgs, disko, securix, home-manager, ... }@inputs: {
  nixosConfigurations = {
    
    # 1. Cible pour votre VRAI laptop
    nix-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        securix.nixosModules.default
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nixos = import ./home/home.nix;
        }
        ./disko-config.nix
        ./configuration.nix
        ./security.nix
        { hardware.enableRedistributableFirmware = true; } 
      ];
    };

    # 2. Cible dédiée aux tests QEMU
    nix-vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        securix.nixosModules.default
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nixos = import ./home/home.nix;
        }
        ./disko-config.nix
        ./configuration.nix
        ./security.nix
        ({ modulesPath, ... }: {
          imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
        })
      ];
    };

  };
};