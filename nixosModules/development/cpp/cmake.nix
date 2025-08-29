{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.cmake
  ];
}
