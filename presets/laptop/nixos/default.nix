{ pkgs, ... }:

{
  imports = [
    ../../desktop/nixos

    ../../../nixosModules/system/thermald.nix
    ../../../nixosModules/system/tlp.nix
    ../../../nixosModules/system/opentabletdriver.nix

  ];

  environment.systemPackages = [
    pkgs.brightnessctl
  ];
}
