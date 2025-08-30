{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.zig.packages.${pkgs.stdenv.hostPlatform.system}.master
    inputs.zls.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  # home.packages = [
  #   pkgs-unstable.zigpkgs.master
  # ];
}
