return {
  cmd = { "wat_server" }, -- make sure wat_server is in your PATH
  filetypes = { "wat", "wast" },
  root_dir = function(fname)
    return require("lspconfig.util").root_pattern ".git"(fname)
      or require("lspconfig.util").path.dirname(fname)
  end,
  settings = {
    -- Optional LSP settings
    format = {},
    lint = { unused = "warn" },
  },
}
