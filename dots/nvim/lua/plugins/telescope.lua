return {
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    opts = {
      hide_numbers = true,
      shade_terminals = true,
      direction = "float",
      float_opts = {
        border = "curved",
        width = 0.87,
        height = 0.80,
        title_pos = "center",
      },
      winbar = {
        enabled = false,
        name_formatter = function(term)
          return term.name
        end,
      },
    },
  },
}
