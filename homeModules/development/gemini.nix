{ pkgs, ... }:

{
  home.file.".gemini/settings.json" = {
    enable = true;
    source = ../../dots/gemini/settings.json;
    target = ".gemini/settings.json";
  };
}
