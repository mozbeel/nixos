-- lua/plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "ToggleTermToggleAll" },
  version = "*",
  lazy = false,
  opts = {
    size = 15,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true,
    direction = "float",
    close_on_exit = false,
    auto_scroll = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      width = math.floor(vim.o.columns * 0.87),
      height = math.floor(vim.o.lines * 0.8),
    },
    winbar = {
      enabled = true,
      name_formatter = function(term)
        return term.name
      end,
    },
  },

  -- config = true,
}
