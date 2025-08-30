return {
  "neovim/nvim-lspconfig",

  event = "BufWinEnter",

  dependencies = { "williamboman/mason.nvim" },

  config = function()
    local lspconfig = require "lspconfig"
    local files = vim.api.nvim_get_runtime_file("lua/lsps/*.lua", true)
    for _, file in ipairs(files) do
      local lsp_name = file:match("([^/]+)%.%w+$")

      local server = lspconfig[lsp_name]
      if server then
        local ok, module = pcall(require, "lsps." .. lsp_name)
        if ok and module then
          local server_opts = module.config or module
          server.setup(server_opts)
        end
      end
    end
  end,
}
