{ meta, ... }:

{
  imports = [
    ../../shared/nixos

    ../../../nixosModules/apps/localsend.nix
    ../../../nixosModules/apps/seahorse.nix

    ../../../nixosModules/graphical/desktop/sddm
    ../../../nixosModules/graphical/display/wayland/hyprland.nix
    ../../../nixosModules/graphical/fonts.nix
    ../../../nixosModules/graphical/qt.nix

    ../../../nixosModules/system/sound/pipewire.nix
    ../../../nixosModules/system/appimage.nix
    ../../../nixosModules/system/udiskie.nix
    ../../../nixosModules/system/opentabletdriver.nix
    ../../../nixosModules/system/huion.nix
  ];

  networking.domain = "desktops.${meta.domain}";
}
