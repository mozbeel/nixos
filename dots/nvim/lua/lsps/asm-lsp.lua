return {
  cmd = { "asm-lsp" },
  filetypes = { "asm", "s", "nasm" },
  root_dir = require("lspconfig.util").root_pattern(".git"),
  settings = {
    asm_lsp = {
      assembler = {
        kind = "nasm",
        parser = {
          predefines = { "BITS 64" }
        }
      }
    }
  }
}
