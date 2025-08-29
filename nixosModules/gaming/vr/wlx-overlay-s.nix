{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.wlx-overlay-s
  ];
}
