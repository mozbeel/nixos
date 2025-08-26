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
    pkgs.whatsie
    pkgs.spotify
    pkgs.xdg-utils
    pkgs.ferium
    pkgs.prismlauncher
    pkgs.krita
    pkgs.android-studio
    pkgs.android-tools
    pkgs.wlx-overlay-s
    pkgs.mangohud
    pkgs.fastfetch
    pkgs.networkmanager
    pkgs.clang
    pkgs.clang-tools
    pkgs.cmake
    pkgs.premake
  ];

  services.wivrn = {
    enable = true;
    openFirewall = true;

    # Write information to /etc/xdg/openxr/1/active_runtime.json, VR applications
    # will automatically read this and work with WiVRn (Note: This does not currently
    # apply for games run in Valve's Proton)
    defaultRuntime = true;

    # Run WiVRn as a systemd service on startup
    autoStart = true;

    # Config for WiVRn (https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md)
    config = {
      enable = true;
      json = {
        # 1.0x foveation scaling
        scale = 1.0;
        # 100 Mb/s
        bitrate = 100000000;
        encoders = [
          {
            encoder = "vaapi";
            codec = "h265";
            # 1.0 x 1.0 scaling
            width = 1.0;
            height = 1.0;
            offset_x = 0.0;
            offset_y = 0.0;
          }
        ];
      };
    };
  };

  programs.alvr = {
    enable = true;
    openFirewall = true;
  };

  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        username = "Alex";
        password = "foo";
      };
    };
  };

  services.printing.enable = true;
}
