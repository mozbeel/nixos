{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs-unstable.stylua
    pkgs.luarocks
    pkgs.luaPackages.tl
    pkgs.luaPackages.teal-language-server

    pkgs.luau
  ];
}
