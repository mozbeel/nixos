{ pkgs, ... }:
{
  home.packages = [ 
    pkgs.unityhub
    pkgs.libunity
    pkgs.unity-test
  ];
}

