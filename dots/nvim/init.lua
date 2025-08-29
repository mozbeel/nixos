vim.g.mapleader = " "

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    repo,
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("options")

require("lazy").setup("plugins", require("laziness"))

vim.schedule(function()
  vim.filetype.add(require("filetypes"))
  require("mappings")
end)

vim.schedule(function()
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
end)

vim.cmd.colorscheme("catppuccin")

-- Add the mason binary path to the PATH variable, so that plugins, such as
-- conform, can use the mason binaries.
local function configure_mason_path()
  local is_windows = vim.fn.has "win32" ~= 0
  local sep = is_windows and "\\" or "/"
  local delim = is_windows and ";" or ":"
  vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep)
      .. delim
      .. vim.env.PATH
end
configure_mason_path()
