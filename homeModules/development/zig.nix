{ inputs, pkgs, ... }:

{
  home.packages = [ inputs.zig.packages.${pkgs.stdenv.hostPlatform.system}.master ];
}
