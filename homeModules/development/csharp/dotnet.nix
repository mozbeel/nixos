{ pkgs, ... }:
{
  home.packages = [
    pkgs.dotnet-sdk
    pkgs.dotnet-sdk_8
  ];
}
