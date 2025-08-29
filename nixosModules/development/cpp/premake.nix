{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.premake5
  ];
}
