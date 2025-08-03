{
  meta,
  inputs,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  imports = [
    ../../../presets/desktop/nixos
    ./hardware-configuration.nix

    ../../../nixosModules/gaming/gamemode.nix
    ../../../nixosModules/gaming/steam.nix
    ../../../nixosModules/gaming/flatpak.nix

    ../../../nixosModules/system/bluetooth.nix
  ];

  boot.loader.grub.enable = true; # Enable GRUB as the bootloader
  boot.loader.grub.device = "nodev"; # Install GRUB on the EFI system partition
  boot.loader.grub.copyKernels = true; # Activate automatic copying of kernel files
  boot.loader.grub.efiSupport = true; # Enable EFI support for GRUB
  boot.loader.grub.enableCryptodisk = true; # Enable GRUB support for encrypted disks
  boot.loader.efi.efiSysMountPoint = "/mnt/boot"; # Mount point of the EFI system partition
  boot.loader.efi.canTouchEfiVariables = true; # Allow GRUB to modify EFI variables for boot entry management

  # Adds custom menu entries for reboot and poweroff
  boot.loader.grub.extraEntries = ''
    menuentry "Reboot" {
        reboot
    }
    menuentry "Poweroff" {
        halt
    }
  '';

  # Specify the Zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  home-manager.users.${meta.user.name} = import ../home {
    inherit inputs pkgs pkgs-unstable;
  };

  environment.systemPackages = [
    pkgs.lmms
    pkgs.spotify
    pkgs.whatsie
  ];

  services.printing.enable = true;
}
