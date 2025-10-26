{ pkgs, inputs, ... }:
let
  hypr-nixpkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with hypr-nixpkgs; [
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    vulkan-volk
  ];
  environment.systemPackages = with hypr-nixpkgs; [
    vulkan-tools
    vulkan-validation-layers
  ];
}