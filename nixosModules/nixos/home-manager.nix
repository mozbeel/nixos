{
  meta,
  inputs,
  pkgs-unstable,
  ...
}:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    # explicitly pass inputs and the unstable pkgs binding
    extraSpecialArgs = {
      inherit inputs meta pkgs-unstable;
    };

    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
  };
}
