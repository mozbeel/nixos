{ pkgs, ... }:
{
  # this breaks because gradle 7 is outdated
  home.packages = [
    pkgs.bluej
  ];

  home.file.".bluej/stylesheets" = {
    enable = true;
    source = ../../dots/bluej/standard-dark-theme;
    target = ".bluej/stylesheets";
  };

}
