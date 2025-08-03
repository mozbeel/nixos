{ pkgs, ... }:

{
  programs.gh = {
    enable = true;
    gitCredentialHelper = { enable = true; };
  };

  home.packages = [ pkgs.act ];
}
