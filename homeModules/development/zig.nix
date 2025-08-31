{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.zig.packages.${pkgs.stdenv.hostPlatform.system}.master
    inputs.zls.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  home.sessionVariables = {
    ZIG_LIB_DIR = "${inputs.zig.packages.${pkgs.stdenv.hostPlatform.system}.master}/lib/zig";
  };
  # home.packages = [
  #   pkgs-unstable.zigpkgs.master
  # ];
}
