return {
  cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
  init_options = {
    fallbackFlags = { "-std=c++17" },
  },
  -- cmd = { "clangd" },
  -- root_markers = { ".clangd", "compile_commands.json" },
  -- filetypes = { "c", "cpp" },
}
