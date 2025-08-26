{ meta, ... }:

{
  imports = [
    ../../../nixosModules/networking/firewall.nix
    ../../../nixosModules/networking/dns.nix
    ../../../nixosModules/networking/tailscale.nix

    ../../../nixosModules/nixos/caches
    ../../../nixosModules/nixos/home-manager.nix
    ../../../nixosModules/nixos/nh.nix
    ../../../nixosModules/nixos/nix-ld.nix
    ../../../nixosModules/nixos/nix.nix

    ../../../nixosModules/security/gnupg.nix
    ../../../nixosModules/security/polkit.nix

    ../../../nixosModules/system/git.nix
    ../../../nixosModules/system/i18n.nix
    ../../../nixosModules/system/packages.nix
    ../../../nixosModules/system/shell.nix
    ../../../nixosModules/system/udiskie.nix
    ../../../nixosModules/system/users.nix

    ../../../nixosModules/themes/catppuccin.nix

    ../../../nixosModules/virtualisations/docker.nix
  ];

  networking.hostName = meta.hostName;

}
