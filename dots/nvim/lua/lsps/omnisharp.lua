return {
  config = {
    cmd = { "OmniSharp", "--languageserver" },
    use_mono = true, -- critical for Unity
    enable_editorconfig_support = true,
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,

    on_attach = function(client, bufnr)
      -- Set indentation to 4 spaces for C# files
      vim.api.nvim_buf_set_option(bufnr, "shiftwidth", 4)
      vim.api.nvim_buf_set_option(bufnr, "tabstop", 4)
      vim.api.nvim_buf_set_option(bufnr, "expandtab", true)
    end,
  },
}
