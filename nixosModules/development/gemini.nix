{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.gemini-cli
  ];
}
