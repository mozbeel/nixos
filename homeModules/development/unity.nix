{ pkgs, ... }:
{
  home.packages = [ pkgs.unityhub ];

  home.file.".config/nvim/unity" = {
    enable = true;
    source = ../../dots/unityhub/neovim;
    target = ".config/nvim/unity";
  };

}
