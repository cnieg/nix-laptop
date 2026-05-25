# ============================================================================
# CONFIGURATION DE PARTITIONNEMENT (DISKO) - BTRFS + LUKS + SÉCURIX FIX
# ============================================================================
{ lib, ... }: {
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1"; # /!\ À remplacer par votre disque cible (ex: /dev/nvme0n1)
        content = {
          type = "gpt";
          partitions = {
            
            # 1. Partition d'amorçage EFI (ESP)
            ESP = {
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                # 🔥 Le mkForce ici résout définitivement le conflit avec la DINUM
                mountpoint = lib.mkForce "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };

            # 2. Partition chiffrée avec LUKS
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                settings = {
                  allowDiscards = true;
                };
                
                # 3. Conteneur Btrfs à l'intérieur du LUKS
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ]; # Force le formatage si nécessaire
                  subvolumes = {
                    "@" = {
                      mountpoint = "/";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "@home" = {
                      mountpoint = "/home";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "@nix" = {
                      mountpoint = "/nix";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                  };
                };

              };
            };

          };
        };
      };
    };
  };
}

