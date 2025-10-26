{ pkgs-unstable, inputs, ... }:

{
  programs.neovim = {
    enable = true;
    # package = inputs.neovim-nightly-overlay.packages.${pkgs-unstable.system}.default;
    # package = pkgs-unstable.neovim;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs-unstable; [
      # Tools
      tree-sitter
      sqlite
      gcc
      gnumake
      ripgrep

      # C#
      mono
      omnisharp-roslyn

      # Nix
      nixd
      nixfmt-rfc-style

      # Python
      ruff
      uv
      python312Packages.grip
      python312Packages.pylatexenc

      # Rust
      rustc
      cargo
      rust-analyzer
      clippy
      rustfmt

      # Lua
      lua-language-server
      luaPackages.tl
      luaPackages.teal-language-server

      # Bash
      bash-language-server

      # NodeJS
      nodejs

      asm-lsp
    ];
  };

  home.file.".config/nvim" = {
    enable = true;
    source = ../../dots/nvim;
    target = ".config/nvim";
  };
}
