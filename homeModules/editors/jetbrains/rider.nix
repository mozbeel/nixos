{ pkgs-unstable, ... }:

{
  imports = [ ./ideavim.nix ];

  home.packages = [ pkgs-unstable.jetbrains.rider ];
}
