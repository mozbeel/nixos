{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.ferium
  ];
}
