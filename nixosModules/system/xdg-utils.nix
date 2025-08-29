{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.xdg-utils
  ];
}
