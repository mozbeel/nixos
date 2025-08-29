{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.spotify
    pkgs.spotify-player
  ];
}
