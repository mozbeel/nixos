{
  description = "mozbeel";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devenv = {
      url = "github:cachix/devenv";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-alien.url = "github:thiagokokada/nix-alien";
    nixgl.url = "github:nix-community/nixGL";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    catppuccin.url = "github:catppuccin/nix";
    catppuccin-where-is-my-sddm-theme.url = "github:catppuccin/where-is-my-sddm-theme";

    ghostty.url = "github:ghostty-org/ghostty";

    zig.url = "github:mitchellh/zig-overlay";
    zls.url = "github:zigtools/zls";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixgl,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;

        config = {
          allowUnfree = true;
          cudaSupport = (import ./meta.nix).cuda;
        };

        overlays = [
          nixgl.overlay

          inputs.zig.overlays.default

          inputs.nur.overlays.default
        ];
      };

      nixosSystem =
        module: overrideMeta:
        let
          updatedMeta = (import ./meta.nix) // overrideMeta;
          specialArgs = {
            inherit inputs pkgs-unstable;
          };
        in
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = specialArgs // {
            meta = updatedMeta;
          };
          modules = [ module ];
        };
    in
    {
      # packages = {
      #   x86_64-linux = {
      #     default = inputs.hyprland.packages.${system}.hyprland;
      #   };
      # };

      # defaultPackage = inputs.hyprland.packages.${system}.hyprland;

      nixpkgs.config.permittedInsecurePackages = [
        "qtwebengine-5.15.19"
      ];

      # nixpkgs.overlays = [
      #   (final: prev: {
      #     ns = prev.ns.overrideAttrs (old: {
      #       doCheck = false;
      #     });
      #   })
      # ];

      nixosConfigurations = {
        nebula = nixosSystem ./machines/nebula/nixos {
          hostName = "nebula";
          hypr = {
            monitors = [
              "HDMI-A-1, 2560x1440@144.00Hz, 0x0, 1"
            ];
          };
        };
      };

    };
}
