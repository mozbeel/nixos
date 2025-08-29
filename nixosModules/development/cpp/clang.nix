{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.clang-tools
    pkgs.clang
  ];
}
