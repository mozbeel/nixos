{ inputs, ... }:

{
  home = {
    packages = [ inputs.ghostty.packages.x86_64-linux.default ];

    file.".config/ghostty/config" = {
      source = ./config;
    };
  };
}