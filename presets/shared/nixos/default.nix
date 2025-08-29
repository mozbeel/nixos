{ meta, ... }:

{
  imports = [
    ../../../nixosModules/audio/lmms.nix

    ../../../nixosModules/apps/whatsie.nix
    ../../../nixosModules/apps/spotify.nix

    ../../../nixosModules/art/krita.nix

    ../../../nixosModules/development/gemini.nix
    ../../../nixosModules/development/android.nix
    ../../../nixosModules/development/cpp.nix
    ../../../nixosModules/apps/qemu.nix

    ../../../nixosModules/gaming/minecraft.nix
    ../../../nixosModules/gaming/vr.nix
    ../../../nixosModules/gaming/steam.nix
    ../../../nixosModules/gaming/gamemode.nix
    ../../../nixosModules/gaming/flatpak.nix

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
    ../../../nixosModules/system/bluetooth.nix
    ../../../nixosModules/system/printing.nix
    ../../../nixosModules/system/xdg-utils.nix

    ../../../nixosModules/themes/catppuccin.nix

    ../../../nixosModules/virtualisations/docker.nix
  ];

  networking.hostName = meta.hostName;

}
