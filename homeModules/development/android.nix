{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.android-tools
    pkgs.android-studio
  ];
}
