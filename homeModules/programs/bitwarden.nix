{ pkgs-unstable, ... }:

{
  home.packages = [
    pkgs-unstable.bitwarden-desktop
    pkgs-unstable.bitwarden-cli
  ];
}
