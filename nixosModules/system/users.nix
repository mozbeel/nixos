{ meta, pkgs, ... }:

{
  # sops.secrets."user/password" = {
  #   neededForUsers = true;
  # };

  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      root = {
        # openssh.authorizedKeys.keys = [ (builtins.readFile ../../dots/ssh/id_ed25519.pub) ];
      };

      ${meta.user.name} = {
        isNormalUser = true;
        description = meta.user.fullName;
        extraGroups = [
          "networkmanager"
          "wheel"
          "docker"
          "wireshark"
          "i2c"
        ];
        # openssh.authorizedKeys.keys = [ (builtins.readFile ../../dots/ssh/id_ed25519.pub) ];
      };
    };
  };
}
