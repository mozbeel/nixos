{ pkgs-unstable, ... }:

let
  ghc = pkgs-unstable.haskellPackages.ghcWithPackages (
    hpkgs: with hpkgs; [
      turtle # Haskell library
      # add more Haskell libraries here
    ]
  );
in
{
  home.packages = [
    ghc
    pkgs-unstable.cabal-install # regular package
    pkgs-unstable.stack # regular package
  ];
}
