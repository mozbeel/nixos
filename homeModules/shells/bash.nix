{
  programs.bash = {
    enable = true;

    shellAliases = import ./aliases.nix;
    bashrcExtra = ''
      # Source shell functions
      source ${./functions.sh}
    '';
  };
}
