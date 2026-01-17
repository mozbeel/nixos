{ pkgs, inputs, ... }:
let
  hypr-nixpkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  environment.systemPackages = with hypr-nixpkgs; [
    vulkan-tools
    vulkan-validation-layers
  ];
}