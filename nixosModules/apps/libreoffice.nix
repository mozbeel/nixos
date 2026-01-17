{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libreoffice-qt
    hunspell
    hunspellDicts.de_AT
    hunspellDicts.uk_UA
  ];
}
