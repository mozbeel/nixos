{
  config,
  lib,
  pkgs,
  ...
}:

let
  wayland = config.wayland.windowManager.hyprland.enable;
in
{
  home.packages = [
    pkgs.winetricks
    pkgs.dbus
    pkgs.sqlite
    pkgs.SDL2
    pkgs.nix-diff
    (lib.mkIf wayland pkgs.wineWowPackages.waylandFull)
  ];
}
