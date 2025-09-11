{ pkgs, ... }:
{
  home.packages = [
    pkgs.bluej
  ];

  home.file.".bluej/stylesheets" = {
    enable = true;
    source = ../../dots/bluej/standard-dark-theme;
    target = ".bluej/stylesheets";
  };

}
