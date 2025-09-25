return {
  config = {
    cmd = { "OmniSharp", "--languageserver" },
    use_mono = true, -- critical for Unity
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
  },
}
