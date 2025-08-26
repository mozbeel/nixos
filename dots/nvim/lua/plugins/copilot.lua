return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot", -- lazy-load on :Copilot
  event = "InsertEnter", -- or lazy-load on insert mode
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("copilot").setup {
      suggestion = {
        enabled = true, -- show inline suggestions
        auto_trigger = true, -- automatically suggest while typing
      },
      panel = { enabled = true }, -- optional panel for multiple suggestions
    }
  end,
}
