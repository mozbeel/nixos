return {
  config = {
    settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
          extraArgs = { "--all-targets", "--workspace" },
        },
        diagnostics = {
          enable = true,
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
          allFeatures = true,
        },
        procMacro = {
          enable = true,
        },
      },
    },

    on_attach = function(_, bufnr)
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end,
  },
}
